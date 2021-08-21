class PrescriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prescription, only: %i[ show edit update destroy ]
  layout "dashboard"

  # GET /prescriptions or /prescriptions.json
  def index
    @prescriptions = Prescription.all
  end

  # GET /prescriptions/1 or /prescriptions/1.json
  def show
  end

  # GET /prescriptions/new
  def new
    @patients = Patient.all
    @prescription = Prescription.new
  end

  # GET /prescriptions/1/edit
  def edit
    @patients = Patient.all
  end

  # POST /prescriptions or /prescriptions.json
  def create
    @prescription = current_user.prescriptions.build(prescription_params)
    @prescription.doctor_id = current_user.id
    respond_to do |format|
      if @prescription.save
        format.html { redirect_to @prescription, notice: "Prescription was successfully created." }
        format.json { render :show, status: :created, location: @prescription }
      else
        @patients = Patient.all

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescriptions/1 or /prescriptions/1.json
  def update
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to @prescription, notice: "Prescription was successfully updated." }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1 or /prescriptions/1.json
  def destroy
    @prescription.destroy
    respond_to do |format|
      format.html { redirect_to prescriptions_url, notice: "Prescription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prescription_params
      params.require(:prescription).permit( :patient_id, prescription_items_attributes: [:id, :medicament,  :posologie,  :_destroy])
    end
end
