class PatientsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /countries
  # GET /countries.json
  def index
    @patients = Patient.all
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
  end

  # GET /countries/new
  def new
    @countries = Country.all
    @patient = Patient.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @patient = current_user.patient.build(patient_params)

    respond_to do |format|
      if @patient.save
        @countries = Country.all

        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
        format.js
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        @countries = Country.all

        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end


  def delete
    @patient = Patient.find(params[:patient_id])
  end


  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @patient.destroy
    @patients = Patient.all

    respond_to do |format|
      format.html { redirect_to countries_url, notice: 'Country was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :status)
    end
end
