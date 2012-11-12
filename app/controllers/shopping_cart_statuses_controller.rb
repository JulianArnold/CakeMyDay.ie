class ShoppingCartStatusesController < ApplicationController
  # GET /shopping_cart_statuses
  # GET /shopping_cart_statuses.json
  def index
    @shopping_cart_statuses = ShoppingCartStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shopping_cart_statuses }
    end
  end

  # GET /shopping_cart_statuses/1
  # GET /shopping_cart_statuses/1.json
  def show
    @shopping_cart_status = ShoppingCartStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shopping_cart_status }
    end
  end

  # GET /shopping_cart_statuses/new
  # GET /shopping_cart_statuses/new.json
  def new
    @shopping_cart_status = ShoppingCartStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shopping_cart_status }
    end
  end

  # GET /shopping_cart_statuses/1/edit
  def edit
    @shopping_cart_status = ShoppingCartStatus.find(params[:id])
  end

  # POST /shopping_cart_statuses
  # POST /shopping_cart_statuses.json
  def create
    @shopping_cart_status = ShoppingCartStatus.new(params[:shopping_cart_status])

    respond_to do |format|
      if @shopping_cart_status.save
        format.html { redirect_to @shopping_cart_status, notice: 'Shopping cart status was successfully created.' }
        format.json { render json: @shopping_cart_status, status: :created, location: @shopping_cart_status }
      else
        format.html { render action: "new" }
        format.json { render json: @shopping_cart_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shopping_cart_statuses/1
  # PUT /shopping_cart_statuses/1.json
  def update
    @shopping_cart_status = ShoppingCartStatus.find(params[:id])

    respond_to do |format|
      if @shopping_cart_status.update_attributes(params[:shopping_cart_status])
        format.html { redirect_to @shopping_cart_status, notice: 'Shopping cart status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shopping_cart_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_cart_statuses/1
  # DELETE /shopping_cart_statuses/1.json
  def destroy
    @shopping_cart_status = ShoppingCartStatus.find(params[:id])
    @shopping_cart_status.destroy

    respond_to do |format|
      format.html { redirect_to shopping_cart_statuses_url }
      format.json { head :no_content }
    end
  end
end
