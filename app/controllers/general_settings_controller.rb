# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class GeneralSettingsController < ApplicationController

  before_filter :logged_in_required
  before_filter :admin_required
  
  def index
    # GET /general_settings
    # GET /general_settings.json
    @general_settings = GeneralSetting.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @general_settings }
    end
  end

  def show
    # GET /general_settings/1
    # GET /general_settings/1.json
    @general_setting = GeneralSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @general_setting }
    end
  end

  def new
    redirect_to general_settings_url, :notice => "Sorry, you are not allowed create a new General Setting."
=begin
    # GET /general_settings/new
    # GET /general_settings/new.json
    @general_setting = GeneralSetting.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @general_setting }
    end
=end
  end

  def edit
    # GET /general_settings/1/edit
    @general_setting = GeneralSetting.find(params[:id])
  end

  def create
    redirect_to general_settings_url, :notice => "Sorry, you are not allowed create a new General Setting."
=begin
    
    # POST /general_settings
    # POST /general_settings.json
    @general_setting = GeneralSetting.new(params[:general_setting])

    respond_to do |format|
      if @general_setting.save
        format.html { redirect_to @general_setting, notice: 'General setting was successfully created.' }
        #format.json { render json: @general_setting, status: :created, location: @general_setting }
      else
        format.html { render action: "new" }
        #format.json { render json: @general_setting.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  def update
    # PUT /general_settings/1
    # PUT /general_settings/1.json
    @general_setting = GeneralSetting.find(params[:id])

    respond_to do |format|
      if @general_setting.update_attributes(params[:general_setting])
        format.html { redirect_to @general_setting, notice: 'General setting was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @general_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /general_settings/1
    # DELETE /general_settings/1.json
    @general_setting = GeneralSetting.find(params[:id])
    #@general_setting.destroy
    flash[:notice] = "Sorry, you are not allowed to delete a General Setting."
    
    respond_to do |format|
      format.html { redirect_to general_settings_url }
      #format.json { head :no_content }
    end
  end

end