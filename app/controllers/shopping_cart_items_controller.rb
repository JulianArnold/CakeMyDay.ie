# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class ShoppingCartItemsController < ApplicationController

  before_filter
  
  def index
    # GET /shopping_cart_items
    # GET /shopping_cart_items.json
    @shopping_cart_items = ShoppingCartItem.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @shopping_cart_items }
    end
  end

  def show
    # GET /shopping_cart_items/1
    # GET /shopping_cart_items/1.json
    @shopping_cart_item = ShoppingCartItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @shopping_cart_item }
    end
  end

  def new
    # GET /shopping_cart_items/new
    # GET /shopping_cart_items/new.json
    @shopping_cart_item = ShoppingCartItem.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @shopping_cart_item }
    end
  end

  def edit
    # GET /shopping_cart_items/1/edit
    @shopping_cart_item = ShoppingCartItem.find(params[:id])
  end

  def create
    # POST /shopping_cart_items
    # POST /shopping_cart_items.json
    @shopping_cart_item = ShoppingCartItem.new(params[:shopping_cart_item])

    respond_to do |format|
      if @shopping_cart_item.save
        format.html { redirect_to @shopping_cart_item, notice: 'Shopping cart item was successfully created.' }
        #format.json { render json: @shopping_cart_item, status: :created, location: @shopping_cart_item }
      else
        format.html { render action: "new" }
        #format.json { render json: @shopping_cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /shopping_cart_items/1
    # PUT /shopping_cart_items/1.json
    @shopping_cart_item = ShoppingCartItem.find(params[:id])

    respond_to do |format|
      if @shopping_cart_item.update_attributes(params[:shopping_cart_item])
        format.html { redirect_to @shopping_cart_item, notice: 'Shopping cart item was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @shopping_cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /shopping_cart_items/1
    # DELETE /shopping_cart_items/1.json
    @shopping_cart_item = ShoppingCartItem.find(params[:id])
    @shopping_cart_item.destroy

    respond_to do |format|
      format.html { redirect_to shopping_cart_items_url }
      #format.json { head :no_content }
    end
  end

end