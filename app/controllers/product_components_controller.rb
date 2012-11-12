class ProductComponentsController < ApplicationController
  # GET /product_components
  # GET /product_components.json
  def index
    @product_components = ProductComponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_components }
    end
  end

  # GET /product_components/1
  # GET /product_components/1.json
  def show
    @product_component = ProductComponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_component }
    end
  end

  # GET /product_components/new
  # GET /product_components/new.json
  def new
    @product_component = ProductComponent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_component }
    end
  end

  # GET /product_components/1/edit
  def edit
    @product_component = ProductComponent.find(params[:id])
  end

  # POST /product_components
  # POST /product_components.json
  def create
    @product_component = ProductComponent.new(params[:product_component])

    respond_to do |format|
      if @product_component.save
        format.html { redirect_to @product_component, notice: 'Product component was successfully created.' }
        format.json { render json: @product_component, status: :created, location: @product_component }
      else
        format.html { render action: "new" }
        format.json { render json: @product_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_components/1
  # PUT /product_components/1.json
  def update
    @product_component = ProductComponent.find(params[:id])

    respond_to do |format|
      if @product_component.update_attributes(params[:product_component])
        format.html { redirect_to @product_component, notice: 'Product component was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_components/1
  # DELETE /product_components/1.json
  def destroy
    @product_component = ProductComponent.find(params[:id])
    @product_component.destroy

    respond_to do |format|
      format.html { redirect_to product_components_url }
      format.json { head :no_content }
    end
  end
end
