class WeeklyQuotaController < ApplicationController
  # GET /weekly_quota
  # GET /weekly_quota.json
  def index
    @weekly_quota = WeeklyQuotum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @weekly_quota }
    end
  end

  # GET /weekly_quota/1
  # GET /weekly_quota/1.json
  def show
    @weekly_quotum = WeeklyQuotum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @weekly_quotum }
    end
  end

  # GET /weekly_quota/new
  # GET /weekly_quota/new.json
  def new
    @weekly_quotum = WeeklyQuotum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @weekly_quotum }
    end
  end

  # GET /weekly_quota/1/edit
  def edit
    @weekly_quotum = WeeklyQuotum.find(params[:id])
  end

  # POST /weekly_quota
  # POST /weekly_quota.json
  def create
    @weekly_quotum = WeeklyQuotum.new(params[:weekly_quotum])

    respond_to do |format|
      if @weekly_quotum.save
        format.html { redirect_to @weekly_quotum, notice: 'Weekly quotum was successfully created.' }
        format.json { render json: @weekly_quotum, status: :created, location: @weekly_quotum }
      else
        format.html { render action: "new" }
        format.json { render json: @weekly_quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /weekly_quota/1
  # PUT /weekly_quota/1.json
  def update
    @weekly_quotum = WeeklyQuotum.find(params[:id])

    respond_to do |format|
      if @weekly_quotum.update_attributes(params[:weekly_quotum])
        format.html { redirect_to @weekly_quotum, notice: 'Weekly quotum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @weekly_quotum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weekly_quota/1
  # DELETE /weekly_quota/1.json
  def destroy
    @weekly_quotum = WeeklyQuotum.find(params[:id])
    @weekly_quotum.destroy

    respond_to do |format|
      format.html { redirect_to weekly_quota_url }
      format.json { head :no_content }
    end
  end
end
