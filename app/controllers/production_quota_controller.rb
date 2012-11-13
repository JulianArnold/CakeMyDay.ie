# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class ProductionQuotaController < ApplicationController

  before_filter
  
  def index
    # GET /production_quota
    # GET /production_quota.json
    @production_quota = ProductionQuotum.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @production_quota }
    end
  end

  def show
    # GET /production_quota/1
    # GET /production_quota/1.json
    @production_quotum = ProductionQuotum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @production_quotum }
    end
  end

  def new
    # GET /production_quota/new
    # GET /production_quota/new.json
    @production_quotum = ProductionQuotum.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @production_quotum }
    end
  end

  def edit
    # GET /production_quota/1/edit
    @production_quotum = ProductionQuotum.find(params[:id])
  end

  def create
    # POST /production_quota
    # POST /production_quota.json
    @production_quotum = ProductionQuotum.new(params[:production_quotum])

    respond_to do |format|
      if @production_quotum.save
        format.html { redirect_to @production_quotum, notice: 'Production quotum was successfully created.' }
        #format.json { render json: @production_quotum, status: :created, location: @production_quotum }
      else
        format.html { render action: "new" }
        #format.json { render json: @production_quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /production_quota/1
    # PUT /production_quota/1.json
    @production_quotum = ProductionQuotum.find(params[:id])

    respond_to do |format|
      if @production_quotum.update_attributes(params[:production_quotum])
        format.html { redirect_to @production_quotum, notice: 'Production quotum was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @production_quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /production_quota/1
    # DELETE /production_quota/1.json
    @production_quotum = ProductionQuotum.find(params[:id])
    @production_quotum.destroy

    respond_to do |format|
      format.html { redirect_to production_quota_url }
      #format.json { head :no_content }
    end
  end

end