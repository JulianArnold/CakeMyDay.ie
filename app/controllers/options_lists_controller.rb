class OptionsListsController < ApplicationController
  # GET /options_lists
  # GET /options_lists.json
  def index
    @options_lists = OptionsList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @options_lists }
    end
  end

  # GET /options_lists/1
  # GET /options_lists/1.json
  def show
    @options_list = OptionsList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @options_list }
    end
  end

  # GET /options_lists/new
  # GET /options_lists/new.json
  def new
    @options_list = OptionsList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @options_list }
    end
  end

  # GET /options_lists/1/edit
  def edit
    @options_list = OptionsList.find(params[:id])
  end

  # POST /options_lists
  # POST /options_lists.json
  def create
    @options_list = OptionsList.new(params[:options_list])

    respond_to do |format|
      if @options_list.save
        format.html { redirect_to @options_list, notice: 'Options list was successfully created.' }
        format.json { render json: @options_list, status: :created, location: @options_list }
      else
        format.html { render action: "new" }
        format.json { render json: @options_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /options_lists/1
  # PUT /options_lists/1.json
  def update
    @options_list = OptionsList.find(params[:id])

    respond_to do |format|
      if @options_list.update_attributes(params[:options_list])
        format.html { redirect_to @options_list, notice: 'Options list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @options_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options_lists/1
  # DELETE /options_lists/1.json
  def destroy
    @options_list = OptionsList.find(params[:id])
    @options_list.destroy

    respond_to do |format|
      format.html { redirect_to options_lists_url }
      format.json { head :no_content }
    end
  end
end
