class AppointmentsController < ApplicationController
 before_action :authenticate_user!
   layout "dashboard"
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  
  # GET /appointments
  # GET /appointments.json
  def index
    
      @appointments = Appointment.all
    
    render layout: "dashboard"
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    

  end

  # GET /appointments/new
  def new
    @patients = Patient.all

    #planning_item = PlanningItem.find(params[:planning_item])
    #puts "PLANNING ITEM: #{planning_item}"

    #profile_id = Planning.find(planning_item.planning_id).user_id

    #doctor = User.find(Profile.find_by(user_id: profile_id).user_id)
    @appointment = Appointment.new#(structure_id: params[:structure_id], doctor_id: doctor.id, day: planning_item.day, start_time: planning_item.start_time, end_time: planning_item.end_time)
    render layout: "dashboard"
  end

  # GET /appointments/1/edit
  def edit
    @patients = Patient.all
    render layout: "dashboard"

  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient_id = current_user.id

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
        format.js
      else
        @patients = Patient.all
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:reason, :doctor_id, :structure_id,  :content, :day, :start_time, :end_time, :status)
    end
end
