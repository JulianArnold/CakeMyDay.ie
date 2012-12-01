# ProductPricesController.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 5th November 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class ProductPricesController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  before_filter :get_variables
  
  def index
    # GET /product_prices
    # GET /product_prices.json
    @product_prices = ProductPrice.all(:include => "product", :order => "products.name, start_at")

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
    @product_price.start_at = Time.now.gmtime
    @product_price.finish_at = "2020-12-31 0:00:00"
    
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
    @product_price.created_by = current_user.id
    
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
    params[:product_price][:updated_by] = current_user.id
    
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
    if @product_price.shopping_cart_items.count == 0
      @product_price.destroy
      flash[:notice] = "ProductPrie has been deleted"
    else
      flash[:notice] = "ProductPrie could not be deleted as it has been used for a sale."
    end

    respond_to do |format|
      format.html { redirect_to product_prices_url }
      #format.json { head :no_content }
    end
  end

  private

  def get_variables
    @products   = Product.all(:include => "product_category", order: "product_categories.running_order, products.running_order, products.name")
    @currencies = Currency.all(conditions: ["active = ?", true], order: "running_order")
  end

end