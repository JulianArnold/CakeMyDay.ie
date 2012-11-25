class FinishedProductsController < ApplicationController
  # GET /finished_products
  # GET /finished_products.json
  def index
    @finished_products = FinishedProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finished_products }
    end
  end

  # GET /finished_products/1
  # GET /finished_products/1.json
  def show
    @finished_product = FinishedProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @finished_product }
    end
  end

  # GET /finished_products/new
  # GET /finished_products/new.json
  def new
    @finished_product = FinishedProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @finished_product }
    end
  end

  # GET /finished_products/1/edit
  def edit
    @finished_product = FinishedProduct.find(params[:id])
  end

  # POST /finished_products
  # POST /finished_products.json
  def create
    @finished_product = FinishedProduct.new(params[:finished_product])

    respond_to do |format|
      if @finished_product.save
        format.html { redirect_to @finished_product, notice: 'Finished product was successfully created.' }
        format.json { render json: @finished_product, status: :created, location: @finished_product }
      else
        format.html { render action: "new" }
        format.json { render json: @finished_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finished_products/1
  # PUT /finished_products/1.json
  def update
    @finished_product = FinishedProduct.find(params[:id])

    respond_to do |format|
      if @finished_product.update_attributes(params[:finished_product])
        format.html { redirect_to @finished_product, notice: 'Finished product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @finished_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finished_products/1
  # DELETE /finished_products/1.json
  def destroy
    @finished_product = FinishedProduct.find(params[:id])
    @finished_product.destroy

    respond_to do |format|
      format.html { redirect_to finished_products_url }
      format.json { head :no_content }
    end
  end
end
