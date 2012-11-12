class GeneralSettingsController < ApplicationController
  # GET /general_settings
  # GET /general_settings.json
  def index
    @general_settings = GeneralSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @general_settings }
    end
  end

  # GET /general_settings/1
  # GET /general_settings/1.json
  def show
    @general_setting = GeneralSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @general_setting }
    end
  end

  # GET /general_settings/new
  # GET /general_settings/new.json
  def new
    @general_setting = GeneralSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @general_setting }
    end
  end

  # GET /general_settings/1/edit
  def edit
    @general_setting = GeneralSetting.find(params[:id])
  end

  # POST /general_settings
  # POST /general_settings.json
  def create
    @general_setting = GeneralSetting.new(params[:general_setting])

    respond_to do |format|
      if @general_setting.save
        format.html { redirect_to @general_setting, notice: 'General setting was successfully created.' }
        format.json { render json: @general_setting, status: :created, location: @general_setting }
      else
        format.html { render action: "new" }
        format.json { render json: @general_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /general_settings/1
  # PUT /general_settings/1.json
  def update
    @general_setting = GeneralSetting.find(params[:id])

    respond_to do |format|
      if @general_setting.update_attributes(params[:general_setting])
        format.html { redirect_to @general_setting, notice: 'General setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @general_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_settings/1
  # DELETE /general_settings/1.json
  def destroy
    @general_setting = GeneralSetting.find(params[:id])
    @general_setting.destroy

    respond_to do |format|
      format.html { redirect_to general_settings_url }
      format.json { head :no_content }
    end
  end
end
