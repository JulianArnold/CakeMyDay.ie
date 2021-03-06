# ImagesController.rb
# 
# Class was originally generated by rails 3.2.8 
# Modified by Dan Laffan (12111619) starting 5th November 2012.
#
# Copyright © 2012, Julian Arnold and Daniel M. Laffan.  All rights reserved.
# Rights in third party code acknowledged.

class ImagesController < ApplicationController

  before_filter :logged_in_required
  before_filter :manager_required
  
  def index
    # GET /images
    # GET /images.json
    @images = Image.all

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @images }
    end
  end

  def show
    # GET /images/1
    # GET /images/1.json
    @image = Image.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @image }
    end
  end

  def new
    # GET /images/new
    # GET /images/new.json
    @image = Image.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @image }
    end
  end

  def edit
    # GET /images/1/edit
    @image = Image.find(params[:id])
  end

  def create
    # POST /images
    # POST /images.json
    @image = Image.new(params[:image])
    @image.uploaded_by = current_user.id
    
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        #format.json { render json: @image, status: :created, location: @image }
      else
        format.html { render action: "new" }
        #format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # PUT /images/1
    # PUT /images/1.json
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # DELETE /images/1
    # DELETE /images/1.json
    @image = Image.find(params[:id])
    if image.finished_product_images.count == 0 and image.product_images.count == 0
      @image.destroy
      flash[:notice] = "Image has been deleted."
    else
      flash[:notice] = "Image could not be deleted."
    end

    respond_to do |format|
      format.html { redirect_to images_url }
      #format.json { head :no_content }
    end
  end

end