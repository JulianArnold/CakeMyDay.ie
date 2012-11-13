# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class CustomersController < ApplicationController

  before_filter
  
  def index
    # GET /customers
    # GET /customers.json
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @customers }
    end
  end

  def show
    # GET /customers/1
    # GET /customers/1.json
    @customer = Customer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @customer }
    end
  end

  def new
    # GET /customers/new
    # GET /customers/new.json
    @customer = Customer.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @customer }
    end
  end

  def edit
    # GET /customers/1/edit
    @customer = Customer.find(params[:id])
  end

  def create
    # POST /customers
    # POST /customers.json
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        #format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        #format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /customers/1
    # PUT /customers/1.json
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /customers/1
    # DELETE /customers/1.json
    @customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      #format.json { head :no_content }
    end
  end

end