# OptionsController.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 5th November 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class OptionsListsController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /options_lists
    # GET /options_lists.json
    @options_lists = OptionsList.all(order: 'name')

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @options_lists }
    end
  end

  def show
    # GET /options_lists/1
    # GET /options_lists/1.json
    @options_list = OptionsList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @options_list }
    end
  end

  def new
    # GET /options_lists/new
    # GET /options_lists/new.json
    @options_list = OptionsList.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @options_list }
    end
  end

  def edit
    # GET /options_lists/1/edit
    @options_list = OptionsList.find(params[:id])
  end

  def create
    # POST /options_lists
    # POST /options_lists.json
    @options_list = OptionsList.new(params[:options_list])

    respond_to do |format|
      if @options_list.save
        format.html { redirect_to @options_list, notice: 'Options list was successfully created.' }
        #format.json { render json: @options_list, status: :created, location: @options_list }
      else
        format.html { render action: "new" }
        #format.json { render json: @options_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /options_lists/1
    # PUT /options_lists/1.json
    @options_list = OptionsList.find(params[:id])

    respond_to do |format|
      if @options_list.update_attributes(params[:options_list])
        format.html { redirect_to @options_list, notice: 'Options list was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @options_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /options_lists/1
    # DELETE /options_lists/1.json
    @options_list = OptionsList.find(params[:id])
    @options_list.destroy

    respond_to do |format|
      format.html { redirect_to options_lists_url }
      #format.json { head :no_content }
    end
  end

end