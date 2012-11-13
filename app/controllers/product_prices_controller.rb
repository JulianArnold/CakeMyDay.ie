# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class ProductPricesController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /product_prices
    # GET /product_prices.json
    @product_prices = ProductPrice.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @product_prices }
    end
  end

  def show
    # GET /product_prices/1
    # GET /product_prices/1.json
    @product_price = ProductPrice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @product_price }
    end
  end

  def new
    # GET /product_prices/new
    # GET /product_prices/new.json
    @product_price = ProductPrice.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @product_price }
    end
  end

  def edit
    # GET /product_prices/1/edit
    @product_price = ProductPrice.find(params[:id])
  end

  def create
    # POST /product_prices
    # POST /product_prices.json
    @product_price = ProductPrice.new(params[:product_price])

    respond_to do |format|
      if @product_price.save
        format.html { redirect_to @product_price, notice: 'Product price was successfully created.' }
        #format.json { render json: @product_price, status: :created, location: @product_price }
      else
        format.html { render action: "new" }
        #format.json { render json: @product_price.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /product_prices/1
    # PUT /product_prices/1.json
    @product_price = ProductPrice.find(params[:id])

    respond_to do |format|
      if @product_price.update_attributes(params[:product_price])
        format.html { redirect_to @product_price, notice: 'Product price was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @product_price.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /product_prices/1
    # DELETE /product_prices/1.json
    @product_price = ProductPrice.find(params[:id])
    @product_price.destroy

    respond_to do |format|
      format.html { redirect_to product_prices_url }
      #format.json { head :no_content }
    end
  end

end