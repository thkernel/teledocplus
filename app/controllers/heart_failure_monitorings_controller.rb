class HeartFailureMonitoringsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_heart_failure_monitoring, only: %i[ show edit update destroy ]

  # GET /heart_failure_monitorings or /heart_failure_monitorings.json
  def index
    @heart_failure_monitorings = HeartFailureMonitoring.all
  end

  # GET /heart_failure_monitorings/1 or /heart_failure_monitorings/1.json
  def show
  end

  # GET /heart_failure_monitorings/new
  def new
    @heart_failure_monitoring = HeartFailureMonitoring.new
  end

  # GET /heart_failure_monitorings/1/edit
  def edit
  end

  # POST /heart_failure_monitorings or /heart_failure_monitorings.json
  def create
    @heart_failure_monitoring = HeartFailureMonitoring.new(heart_failure_monitoring_params)

    respond_to do |format|
      if @heart_failure_monitoring.save
        format.html { redirect_to @heart_failure_monitoring, notice: "Heart failure monitoring was successfully created." }
        format.json { render :show, status: :created, location: @heart_failure_monitoring }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @heart_failure_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heart_failure_monitorings/1 or /heart_failure_monitorings/1.json
  def update
    respond_to do |format|
      if @heart_failure_monitoring.update(heart_failure_monitoring_params)
        format.html { redirect_to @heart_failure_monitoring, notice: "Heart failure monitoring was successfully updated." }
        format.json { render :show, status: :ok, location: @heart_failure_monitoring }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @heart_failure_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heart_failure_monitorings/1 or /heart_failure_monitorings/1.json
  def destroy
    @heart_failure_monitoring.destroy
    respond_to do |format|
      format.html { redirect_to heart_failure_monitorings_url, notice: "Heart failure monitoring was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heart_failure_monitoring
      @heart_failure_monitoring = HeartFailureMonitoring.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def heart_failure_monitoring_params
      params.require(:heart_failure_monitoring).permit(:uid, :patient_id, :weight, :cardiac_frequency, :breathlessness, :feet_swelling, :status, :comments, :user_id)
    end
end
