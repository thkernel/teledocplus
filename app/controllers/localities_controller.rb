class LocalitiesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_locality, only: [:show, :edit, :update, :destroy]

  # GET /localities
  # GET /localities.json
  def index
    @localities = Locality.all
  end

  # GET /localities/1
  # GET /localities/1.json
  def show
  end

  # GET /localities/new
  def new
    @locality = Locality.new
  end

  # GET /localities/1/edit
  def edit
  end

  # POST /localities
  # POST /localities.json
  def create
    @locality = current_user.localities.build(locality_params)

    respond_to do |format|
      if @locality.save
        @localities = Locality.all
        format.html { redirect_to @locality, notice: 'Locality was successfully created.' }
        format.json { render :show, status: :created, location: @locality }
        format.js
      else
        format.html { render :new }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /localities/1
  # PATCH/PUT /localities/1.json
  def update
    respond_to do |format|
      if @locality.update(locality_params)
        @localities = Locality.all
        format.html { redirect_to @locality, notice: 'Locality was successfully updated.' }
        format.json { render :show, status: :ok, location: @locality }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @locality = Locality.find(params[:locality_id])
  end


  # DELETE /localities/1
  # DELETE /localities/1.json
  def destroy
    @locality.destroy
    @localities = Locality.all
    respond_to do |format|
      format.html { redirect_to localities_url, notice: 'Locality was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locality
      @locality = Locality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def locality_params
      params.require(:locality).permit(:country_id, :region, :city, :neighbourhood)
    end
end
