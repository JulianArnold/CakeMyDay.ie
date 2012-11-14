# Copyright © 2012, Daniel Martin Laffan.  All rights reserved.
class UsersController < ApplicationController

  before_filter :logged_out_required, :only => [:new, :create]
  before_filter :logged_in_required, :only => [:show, :edit, :update, :destroy]
  before_filter :admin_required, :only => [:index, :destroy]
  
  def index
    # GET /users
    # GET /users.json
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @users }
    end
  end

  def show
    # GET /users/1
    # GET /users/1.json
    if current_user and current_user.admin? == false
      @user = current_user
    else
      @user = User.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @user }
    end
  end

  def new
    # GET /users/new
    # GET /users/new.json
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @user }
    end
  end

  def edit
    # GET /users/1/edit
    @user = User.find(params[:id])
  end

  def create
    # POST /users
    # POST /users.json
    @user = User.new(params[:user])
    @user.user_group_id = UserGroup.find_by_name("Customers").id
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /users/1
    # PUT /users/1.json
    if current_user and current_user.admin? == false
      @user = current_user
    else
      @user = User.find(params[:id])
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /users/1
    # DELETE /users/1.json
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      #format.json { head :no_content }
    end
  end

end