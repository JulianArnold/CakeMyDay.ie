# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class ShoppingCartsController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /shopping_carts
    # GET /shopping_carts.json
    @shopping_carts = ShoppingCart.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @shopping_carts }
    end
  end

  def show
    # GET /shopping_carts/1
    # GET /shopping_carts/1.json
    @shopping_cart = ShoppingCart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @shopping_cart }
    end
  end

  def new
    # GET /shopping_carts/new
    # GET /shopping_carts/new.json
    @shopping_cart = ShoppingCart.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @shopping_cart }
    end
  end

  def edit
    # GET /shopping_carts/1/edit
    @shopping_cart = ShoppingCart.find(params[:id])
  end

  def create
    # POST /shopping_carts
    # POST /shopping_carts.json
    @shopping_cart = ShoppingCart.new(params[:shopping_cart])

    respond_to do |format|
      if @shopping_cart.save
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully created.' }
        #format.json { render json: @shopping_cart, status: :created, location: @shopping_cart }
      else
        format.html { render action: "new" }
        #format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /shopping_carts/1
    # PUT /shopping_carts/1.json
    @shopping_cart = ShoppingCart.find(params[:id])

    respond_to do |format|
      if @shopping_cart.update_attributes(params[:shopping_cart])
        format.html { redirect_to @shopping_cart, notice: 'Shopping cart was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @shopping_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /shopping_carts/1
    # DELETE /shopping_carts/1.json
    @shopping_cart = ShoppingCart.find(params[:id])
    @shopping_cart.destroy

    respond_to do |format|
      format.html { redirect_to shopping_carts_url }
      #format.json { head :no_content }
    end
  end

end