# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class ProductCategoriesController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /product_categories
    # GET /product_categories.json
    @product_categories = ProductCategory.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @product_categories }
    end
  end

  def show
    # GET /product_categories/1
    # GET /product_categories/1.json
    @product_category = ProductCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @product_category }
    end
  end

  def new
    # GET /product_categories/new
    # GET /product_categories/new.json
    @product_category = ProductCategory.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @product_category }
    end
  end

  def edit
    # GET /product_categories/1/edit
    @product_category = ProductCategory.find(params[:id])
  end

  def create
    # POST /product_categories
    # POST /product_categories.json
    @product_category = ProductCategory.new(params[:product_category])

    respond_to do |format|
      if @product_category.save
        format.html { redirect_to @product_category, notice: 'Product category was successfully created.' }
        #format.json { render json: @product_category, status: :created, location: @product_category }
      else
        format.html { render action: "new" }
        #format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /product_categories/1
    # PUT /product_categories/1.json
    @product_category = ProductCategory.find(params[:id])

    respond_to do |format|
      if @product_category.update_attributes(params[:product_category])
        format.html { redirect_to @product_category, notice: 'Product category was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @product_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /product_categories/1
    # DELETE /product_categories/1.json
    @product_category = ProductCategory.find(params[:id])
    @product_category.destroy

    respond_to do |format|
      format.html { redirect_to product_categories_url }
      #format.json { head :no_content }
    end
  end

end