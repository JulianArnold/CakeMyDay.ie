# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class CurrenciesController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /currencies
    # GET /currencies.json
    @currencies = Currency.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @currencies }
    end
  end

  def show
    # GET /currencies/1
    # GET /currencies/1.json
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @currency }
    end
  end

  def new
    # GET /currencies/new
    # GET /currencies/new.json
    @currency = Currency.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @currency }
    end
  end

  def edit
    # GET /currencies/1/edit
    @currency = Currency.find(params[:id])
  end

  def create
    # POST /currencies
    # POST /currencies.json
    @currency = Currency.new(params[:currency])

    respond_to do |format|
      if @currency.save
        format.html { redirect_to @currency, notice: 'Currency was successfully created.' }
        #format.json { render json: @currency, status: :created, location: @currency }
      else
        format.html { render action: "new" }
        #format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /currencies/1
    # PUT /currencies/1.json
    @currency = Currency.find(params[:id])

    respond_to do |format|
      if @currency.update_attributes(params[:currency])
        format.html { redirect_to @currency, notice: 'Currency was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /currencies/1
    # DELETE /currencies/1.json
    @currency = Currency.find(params[:id])
    @currency.destroy

    respond_to do |format|
      format.html { redirect_to currencies_url }
      #format.json { head :no_content }
    end
  end

end