class PayPalStatusesController < ApplicationController
  # GET /pay_pal_statuses
  # GET /pay_pal_statuses.json
  def index
    @pay_pal_statuses = PayPalStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pay_pal_statuses }
    end
  end

  # GET /pay_pal_statuses/1
  # GET /pay_pal_statuses/1.json
  def show
    @pay_pal_status = PayPalStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pay_pal_status }
    end
  end

  # GET /pay_pal_statuses/new
  # GET /pay_pal_statuses/new.json
  def new
    @pay_pal_status = PayPalStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pay_pal_status }
    end
  end

  # GET /pay_pal_statuses/1/edit
  def edit
    @pay_pal_status = PayPalStatus.find(params[:id])
  end

  # POST /pay_pal_statuses
  # POST /pay_pal_statuses.json
  def create
    @pay_pal_status = PayPalStatus.new(params[:pay_pal_status])

    respond_to do |format|
      if @pay_pal_status.save
        format.html { redirect_to @pay_pal_status, notice: 'Pay pal status was successfully created.' }
        format.json { render json: @pay_pal_status, status: :created, location: @pay_pal_status }
      else
        format.html { render action: "new" }
        format.json { render json: @pay_pal_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pay_pal_statuses/1
  # PUT /pay_pal_statuses/1.json
  def update
    @pay_pal_status = PayPalStatus.find(params[:id])

    respond_to do |format|
      if @pay_pal_status.update_attributes(params[:pay_pal_status])
        format.html { redirect_to @pay_pal_status, notice: 'Pay pal status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pay_pal_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_pal_statuses/1
  # DELETE /pay_pal_statuses/1.json
  def destroy
    @pay_pal_status = PayPalStatus.find(params[:id])
    @pay_pal_status.destroy

    respond_to do |format|
      format.html { redirect_to pay_pal_statuses_url }
      format.json { head :no_content }
    end
  end
end
