class ProductionQuotaController < ApplicationController
  # GET /production_quota
  # GET /production_quota.json
  def index
    @production_quota = ProductionQuotum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @production_quota }
    end
  end

  # GET /production_quota/1
  # GET /production_quota/1.json
  def show
    @production_quotum = ProductionQuotum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @production_quotum }
    end
  end

  # GET /production_quota/new
  # GET /production_quota/new.json
  def new
    @production_quotum = ProductionQuotum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @production_quotum }
    end
  end

  # GET /production_quota/1/edit
  def edit
    @production_quotum = ProductionQuotum.find(params[:id])
  end

  # POST /production_quota
  # POST /production_quota.json
  def create
    @production_quotum = ProductionQuotum.new(params[:production_quotum])

    respond_to do |format|
      if @production_quotum.save
        format.html { redirect_to @production_quotum, notice: 'Production quotum was successfully created.' }
        format.json { render json: @production_quotum, status: :created, location: @production_quotum }
      else
        format.html { render action: "new" }
        format.json { render json: @production_quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /production_quota/1
  # PUT /production_quota/1.json
  def update
    @production_quotum = ProductionQuotum.find(params[:id])

    respond_to do |format|
      if @production_quotum.update_attributes(params[:production_quotum])
        format.html { redirect_to @production_quotum, notice: 'Production quotum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @production_quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_quota/1
  # DELETE /production_quota/1.json
  def destroy
    @production_quotum = ProductionQuotum.find(params[:id])
    @production_quotum.destroy

    respond_to do |format|
      format.html { redirect_to production_quota_url }
      format.json { head :no_content }
    end
  end
end
