class PatientProfilesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_patient_profile, only: [:show, :edit, :update, :destroy]

  # GET /countries
  # GET /countries.json
  def index
    @patient_profiles = PatientProfile.all
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    
    @countries = Country.all
    @patient_profile = PatientProfile.new
  end

  # GET /countries/1/edit
  def edit
    @countries = Country.all
  end

  # POST /countries
  # POST /countries.json
  def create
    @patient_profile = current_user.patient_profiles.build(patient_profile_params)

    respond_to do |format|
      if @patient_profile.save
        # Create user account
        User.create(userable: @patient_profile, login: "",  email: @patient_profile.email,  password: "default@2021", password_confirmation: "default@2021", role_id: Role.find_by(name: "Patient").id)

        
        @patient_profiles = PatientProfile.all

        format.html { redirect_to @patient_profile, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
        format.js
      else
        @countries = Country.all
        format.html { render :new }
        format.json { render json: @patient_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @patient_profile.update(patient_profile_params)
        @countries = Country.all
        @patient_profiles= PatientProfile.all

        format.html { redirect_to @patient_profile, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient_profile }
        format.js
      else
        @countries = Country.all
        format.html { render :edit }
        format.json { render json: @patient_profile.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @patient_profile = PatientProfile.find(params[:patient_profile_id])
  end


  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @patient.destroy
    @patients = PatientProfile.all

    respond_to do |format|
      format.html { redirect_to patient_profiles_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_profile
      @patient = PatientProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_profile_params
      params.require(:patient_profile).permit(:first_name, :last_name, :civility, :age, :address, :phone, :country_id, :locality, :email, :pathology, :monitoring_frequency, :description )
    end
end
