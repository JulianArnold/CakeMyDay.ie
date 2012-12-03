# ProductionQuotaController.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 5th November 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class ProductionQuotaController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  before_filter :admin_required, :only => 'destroy'
  before_filter :auto_generate_new_rows
  
  def index
    # GET /production_quota
    # GET /production_quota.json
    @production_quota = ProductionQuotum.all(order: "start_date")

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
        format.html { redirect_to production_quota_url, notice: 'Production quotum was successfully created.' }
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
     
    carts = @production_quotum.shopping_carts.all(:include => "shopping_cart_status", conditions: ["shopping_cart_statuses.paid_cart = ?", true])
    current_workload = 0
    carts.each do |cart|
      cart.shopping_cart_items.each do |item|
        current_workload += item.product.production_quota_value.to_i
      end
    end
    
    if current_workload > params[:production_quotum][:maximum_cakes_allowed].to_i
      flash[:notice] = "Sorry, you can't reduce that week's limit. The current workload is already " + current_workload.to_i.to_s + "."
    else
      @production_quotum.maximum_cakes_allowed = params[:production_quotum][:maximum_cakes_allowed].to_i
    end
    
    respond_to do |format|
      if @production_quotum.save
        format.html { redirect_to production_quota_url, notice: 'Production quotum was successfully updated.' }
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
    if @production_quotum.cakes.count == 0
      @production_quotum.destroy
      flash[:notice] = "Production Quota deleted."
    else
      flash[:notice] = "Production Quota could not be deleted."
    end
    
    respond_to do |format|
      format.html { redirect_to production_quota_url }
      #format.json { head :no_content }
    end
  end

  private
  
  def auto_generate_new_rows
    ProductionQuotum.auto_generate
  end

end