# Copyright © 2012, Julian Arnold and Daniel Martin Laffan.  All rights reserved.
class PayPalTransactionsController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /pay_pal_transactions
    # GET /pay_pal_transactions.json
    @pay_pal_transactions = PayPalTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @pay_pal_transactions }
    end
  end

  def show
    # GET /pay_pal_transactions/1
    # GET /pay_pal_transactions/1.json
    @pay_pal_transaction = PayPalTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @pay_pal_transaction }
    end
  end

  def new
    # GET /pay_pal_transactions/new
    # GET /pay_pal_transactions/new.json
    @pay_pal_transaction = PayPalTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @pay_pal_transaction }
    end
  end

  def edit
    # GET /pay_pal_transactions/1/edit
    @pay_pal_transaction = PayPalTransaction.find(params[:id])
  end

  def create
    # POST /pay_pal_transactions
    # POST /pay_pal_transactions.json
    @pay_pal_transaction = PayPalTransaction.new(params[:pay_pal_transaction])

    respond_to do |format|
      if @pay_pal_transaction.save
        format.html { redirect_to @pay_pal_transaction, notice: 'Pay pal transaction was successfully created.' }
        #format.json { render json: @pay_pal_transaction, status: :created, location: @pay_pal_transaction }
      else
        format.html { render action: "new" }
        #format.json { render json: @pay_pal_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /pay_pal_transactions/1
    # PUT /pay_pal_transactions/1.json
    @pay_pal_transaction = PayPalTransaction.find(params[:id])

    respond_to do |format|
      if @pay_pal_transaction.update_attributes(params[:pay_pal_transaction])
        format.html { redirect_to @pay_pal_transaction, notice: 'Pay pal transaction was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @pay_pal_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /pay_pal_transactions/1
    # DELETE /pay_pal_transactions/1.json
    @pay_pal_transaction = PayPalTransaction.find(params[:id])
    @pay_pal_transaction.destroy

    respond_to do |format|
      format.html { redirect_to pay_pal_transactions_url }
      #format.json { head :no_content }
    end
  end

end