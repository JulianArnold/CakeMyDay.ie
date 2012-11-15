# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class ProductsController < ApplicationController

  before_filter :logged_in_required, :except => [:index, :show, :search]
  before_filter :manager_required, :except => [:index, :show, :search]
  before_filter :admin_required, :only => :destroy

  def search
    @products = Product.search(params[:search_query])
    render :search_results
  end

  def index
    # GET /products
    # GET /products.json
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @products }
    end
  end

  def show
    # GET /products/1
    # GET /products/1.json
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @product }
    end
  end

  def new
    # GET /products/new
    # GET /products/new.json
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @product }
    end
  end

  def edit
    # GET /products/1/edit
    @product = Product.find(params[:id])
  end

  def create
    # POST /products
    # POST /products.json
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        #format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /products/1
    # PUT /products/1.json
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /products/1
    # DELETE /products/1.json
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      #format.json { head :no_content }
    end
  end

end