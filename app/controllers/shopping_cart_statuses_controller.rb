# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class ShoppingCartStatusesController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /shopping_cart_statuses
    # GET /shopping_cart_statuses.json
    @shopping_cart_statuses = ShoppingCartStatus.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @shopping_cart_statuses }
    end
  end

  def show
    # GET /shopping_cart_statuses/1
    # GET /shopping_cart_statuses/1.json
    @shopping_cart_status = ShoppingCartStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @shopping_cart_status }
    end
  end

  def new
    # GET /shopping_cart_statuses/new
    # GET /shopping_cart_statuses/new.json
    @shopping_cart_status = ShoppingCartStatus.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @shopping_cart_status }
    end
  end

  def edit
    # GET /shopping_cart_statuses/1/edit
    @shopping_cart_status = ShoppingCartStatus.find(params[:id])
  end

  def create
    # POST /shopping_cart_statuses
    # POST /shopping_cart_statuses.json
    @shopping_cart_status = ShoppingCartStatus.new(params[:shopping_cart_status])

    respond_to do |format|
      if @shopping_cart_status.save
        format.html { redirect_to @shopping_cart_status, notice: 'Shopping cart status was successfully created.' }
        #format.json { render json: @shopping_cart_status, status: :created, location: @shopping_cart_status }
      else
        format.html { render action: "new" }
        #format.json { render json: @shopping_cart_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /shopping_cart_statuses/1
    # PUT /shopping_cart_statuses/1.json
    @shopping_cart_status = ShoppingCartStatus.find(params[:id])

    respond_to do |format|
      if @shopping_cart_status.update_attributes(params[:shopping_cart_status])
        format.html { redirect_to @shopping_cart_status, notice: 'Shopping cart status was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @shopping_cart_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /shopping_cart_statuses/1
    # DELETE /shopping_cart_statuses/1.json
    @shopping_cart_status = ShoppingCartStatus.find(params[:id])
    @shopping_cart_status.destroy

    respond_to do |format|
      format.html { redirect_to shopping_cart_statuses_url }
      #format.json { head :no_content }
    end
  end

end