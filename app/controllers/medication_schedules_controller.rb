class MedicationSchedulesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  before_action :set_medication_schedule, only: %i[ show edit update destroy ]

  # GET /medication_schedules or /medication_schedules.json
  def index
    @medication_schedules = MedicationSchedule.all
  end

  # GET /medication_schedules/1 or /medication_schedules/1.json
  def show
  end

  # GET /medication_schedules/new
  def new
    @patients = Patient.all
    @medication_schedule = MedicationSchedule.new
  end

  # GET /medication_schedules/1/edit
  def edit
    @patients = Patient.all
  end

  # POST /medication_schedules or /medication_schedules.json
  def create
    @medication_schedule = current_user.medication_schedules.build(medication_schedule_params)
    @medication_schedule.doctor_id = current_user.id
    respond_to do |format|
      if @medication_schedule.save
        format.html { redirect_to @medication_schedule, notice: "Medication schedule was successfully created." }
        format.json { render :show, status: :created, location: @medication_schedule }
        format.js
      else
        @patients = Patient.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medication_schedule.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /medication_schedules/1 or /medication_schedules/1.json
  def update
    respond_to do |format|
      if @medication_schedule.update(medication_schedule_params)
        format.html { redirect_to @medication_schedule, notice: "Medication schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @medication_schedule }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medication_schedule.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @medication_schedule = MedicationSchedule.find(params[:medication_schedule_id])
    end

  # DELETE /medication_schedules/1 or /medication_schedules/1.json
  def destroy
    @medication_schedule.destroy
    respond_to do |format|
      format.html { redirect_to medication_schedules_url, notice: "Medication schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication_schedule
      @medication_schedule = MedicationSchedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medication_schedule_params
      params.require(:medication_schedule).permit(:patient_id, :morning_number, :noo_number, :evening_number,  :comments)
    end
end
