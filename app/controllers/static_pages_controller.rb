# StaticPagesController.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 5th November 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class StaticPagesController < ApplicationController

  before_filter :logged_in_required, :except => 'display'
  before_filter :manager_required, :except => 'display'
  
  def display
    @page = StaticPage.first(:conditions => ["menu_label LIKE ?", "%" + params[:page].gsub('_',' ') + "%" ])
    if @page
      # nothing special here
    else
      redirect_to root_url, :notice => "Sorry, we couldn't find what you requested."
    end
  end
  
  def index
    # GET /static_pages
    # GET /static_pages.json
    @navbar_static_pages = StaticPage.all(:conditions => ["show_in_main_menu = ?", true], :order => "main_menu_running_order")
    @footer_static_pages = StaticPage.all(:conditions => ["show_in_page_footer = ?", true], :order => "footer_running_order")
    @hidden_static_pages = StaticPage.all(:conditions => ["show_in_main_menu <> ? and show_in_page_footer <> ?", true, true], :order => "menu_label")
    
    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @static_pages }
    end
  end

  def show
    # GET /static_pages/1
    # GET /static_pages/1.json
    @static_page = StaticPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @static_page }
    end
  end

  def new
    # GET /static_pages/new
    # GET /static_pages/new.json
    @static_page = StaticPage.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @static_page }
    end
  end

  def edit
    # GET /static_pages/1/edit
    @static_page = StaticPage.find(params[:id])
  end

  def create
    # POST /static_pages
    # POST /static_pages.json
    @static_page = StaticPage.new(params[:static_page])

    respond_to do |format|
      if @static_page.save
        format.html { redirect_to @static_page, notice: 'Static page was successfully created.' }
        #format.json { render json: @static_page, status: :created, location: @static_page }
      else
        format.html { render action: "new" }
        #format.json { render json: @static_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /static_pages/1
    # PUT /static_pages/1.json
    @static_page = StaticPage.find(params[:id])

    respond_to do |format|
      if @static_page.update_attributes(params[:static_page])
        format.html { redirect_to @static_page, notice: 'Static page was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @static_page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /static_pages/1
    # DELETE /static_pages/1.json
    @static_page = StaticPage.find(params[:id])
    @static_page.destroy

    respond_to do |format|
      format.html { redirect_to static_pages_url }
      #format.json { head :no_content }
    end
  end

end