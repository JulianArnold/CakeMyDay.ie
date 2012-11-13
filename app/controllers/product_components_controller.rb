# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class ProductComponentsController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /product_components
    # GET /product_components.json
    @product_components = ProductComponent.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @product_components }
    end
  end

  def show
    # GET /product_components/1
    # GET /product_components/1.json
    @product_component = ProductComponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @product_component }
    end
  end

  def new
    # GET /product_components/new
    # GET /product_components/new.json
    @product_component = ProductComponent.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @product_component }
    end
  end

  def edit
    # GET /product_components/1/edit
    @product_component = ProductComponent.find(params[:id])
  end

  def create
    # POST /product_components
    # POST /product_components.json
    @product_component = ProductComponent.new(params[:product_component])

    respond_to do |format|
      if @product_component.save
        format.html { redirect_to @product_component, notice: 'Product component was successfully created.' }
        #format.json { render json: @product_component, status: :created, location: @product_component }
      else
        format.html { render action: "new" }
        #format.json { render json: @product_component.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /product_components/1
    # PUT /product_components/1.json
    @product_component = ProductComponent.find(params[:id])

    respond_to do |format|
      if @product_component.update_attributes(params[:product_component])
        format.html { redirect_to @product_component, notice: 'Product component was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @product_component.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /product_components/1
    # DELETE /product_components/1.json
    @product_component = ProductComponent.find(params[:id])
    @product_component.destroy

    respond_to do |format|
      format.html { redirect_to product_components_url }
      #format.json { head :no_content }
    end
  end

end