# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class WeeklyQuotaController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /weekly_quota
    # GET /weekly_quota.json
    @weekly_quota = WeeklyQuotum.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @weekly_quota }
    end
  end

  def show
    # GET /weekly_quota/1
    # GET /weekly_quota/1.json
    @weekly_quotum = WeeklyQuotum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @weekly_quotum }
    end
  end

  def new
    # GET /weekly_quota/new
    # GET /weekly_quota/new.json
    @weekly_quotum = WeeklyQuotum.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @weekly_quotum }
    end
  end

  def edit
    # GET /weekly_quota/1/edit
    @weekly_quotum = WeeklyQuotum.find(params[:id])
  end

  def create
    # POST /weekly_quota
    # POST /weekly_quota.json
    @weekly_quotum = WeeklyQuotum.new(params[:weekly_quotum])

    respond_to do |format|
      if @weekly_quotum.save
        format.html { redirect_to @weekly_quotum, notice: 'Weekly quotum was successfully created.' }
        #format.json { render json: @weekly_quotum, status: :created, location: @weekly_quotum }
      else
        format.html { render action: "new" }
        #format.json { render json: @weekly_quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /weekly_quota/1
    # PUT /weekly_quota/1.json
    @weekly_quotum = WeeklyQuotum.find(params[:id])

    respond_to do |format|
      if @weekly_quotum.update_attributes(params[:weekly_quotum])
        format.html { redirect_to @weekly_quotum, notice: 'Weekly quotum was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @weekly_quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /weekly_quota/1
    # DELETE /weekly_quota/1.json
    @weekly_quotum = WeeklyQuotum.find(params[:id])
    @weekly_quotum.destroy

    respond_to do |format|
      format.html { redirect_to weekly_quota_url }
      #format.json { head :no_content }
    end
  end

end