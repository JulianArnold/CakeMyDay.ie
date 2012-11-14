# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class PayPalStatusesController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /pay_pal_statuses
    # GET /pay_pal_statuses.json
    @pay_pal_statuses = PayPalStatus.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @pay_pal_statuses }
    end
  end

  def show
    # GET /pay_pal_statuses/1
    # GET /pay_pal_statuses/1.json
    @pay_pal_status = PayPalStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @pay_pal_status }
    end
  end

  def new
    # GET /pay_pal_statuses/new
    # GET /pay_pal_statuses/new.json
    @pay_pal_status = PayPalStatus.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @pay_pal_status }
    end
  end

  def edit
    # GET /pay_pal_statuses/1/edit
    @pay_pal_status = PayPalStatus.find(params[:id])
  end

  def create
    # POST /pay_pal_statuses
    # POST /pay_pal_statuses.json
    @pay_pal_status = PayPalStatus.new(params[:pay_pal_status])

    respond_to do |format|
      if @pay_pal_status.save
        format.html { redirect_to @pay_pal_status, notice: 'Pay pal status was successfully created.' }
        #format.json { render json: @pay_pal_status, status: :created, location: @pay_pal_status }
      else
        format.html { render action: "new" }
        #format.json { render json: @pay_pal_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /pay_pal_statuses/1
    # PUT /pay_pal_statuses/1.json
    @pay_pal_status = PayPalStatus.find(params[:id])

    respond_to do |format|
      if @pay_pal_status.update_attributes(params[:pay_pal_status])
        format.html { redirect_to @pay_pal_status, notice: 'Pay pal status was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @pay_pal_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /pay_pal_statuses/1
    # DELETE /pay_pal_statuses/1.json
    @pay_pal_status = PayPalStatus.find(params[:id])
    @pay_pal_status.destroy

    respond_to do |format|
      format.html { redirect_to pay_pal_statuses_url }
      #format.json { head :no_content }
    end
  end

end