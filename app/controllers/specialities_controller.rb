class SpecialitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :delete, :update]
  layout "dashboard"


  before_action :set_speciality, only: [:show, :edit, :update, :destroy]

  # GET /specialities
  # GET /specialities.json
  def index
    @specialities = Speciality.all
  end

  def all_specialities
    @specialities = Speciality.order(created_at: :desc).paginate(:page => params[:page], :per_page => 20)
    render layout: "front"
  end

  def name_filter 
    @speciality = Speciality.find(params[:id])
    @doctors = Profile.where(speciality: @speciality.name)
    render layout: "front"
  end

  # GET /specialities/1
  # GET /specialities/1.json
  def show
  end

  # GET /specialities/new
  def new
    @speciality = Speciality.new
  end

  # GET /specialities/1/edit
  def edit
  end

  # POST /specialities
  # POST /specialities.json
  def create
    @speciality = current_user.specialities.build(speciality_params)

    respond_to do |format|
      if @speciality.save
        @specialities = Speciality.all

        format.html { redirect_to @speciality, notice: 'Speciality was successfully created.' }
        format.json { render :show, status: :created, location: @speciality }
        format.js
      else
        format.html { render :new }
        format.json { render json: @speciality.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /specialities/1
  # PATCH/PUT /specialities/1.json
  def update
    respond_to do |format|
      if @speciality.update(speciality_params)
        @specialities = Speciality.all

        format.html { redirect_to @speciality, notice: 'Speciality was successfully updated.' }
        format.json { render :show, status: :ok, location: @speciality }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @speciality.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @speciality = Speciality.find(params[:speciality_id])
  end


  # DELETE /specialities/1
  # DELETE /specialities/1.json
  def destroy
    @speciality.destroy
    @specialities = Speciality.all

    respond_to do |format|
      format.html { redirect_to specialities_url, notice: 'Speciality was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_speciality
      @speciality = Speciality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def speciality_params
      params.require(:speciality).permit(:name)
    end
end
