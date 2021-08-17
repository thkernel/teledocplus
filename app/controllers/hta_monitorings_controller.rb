class HtaMonitoringsController < ApplicationController
  before_action :set_hta_monitoring, only: %i[ show edit update destroy ]

  # GET /hta_monitorings or /hta_monitorings.json
  def index
    @hta_monitorings = HtaMonitoring.all
  end

  # GET /hta_monitorings/1 or /hta_monitorings/1.json
  def show
  end

  # GET /hta_monitorings/new
  def new
    @hta_monitoring = HtaMonitoring.new
  end

  # GET /hta_monitorings/1/edit
  def edit
  end

  # POST /hta_monitorings or /hta_monitorings.json
  def create
    @hta_monitoring = HtaMonitoring.new(hta_monitoring_params)

    respond_to do |format|
      if @hta_monitoring.save
        format.html { redirect_to @hta_monitoring, notice: "Hta monitoring was successfully created." }
        format.json { render :show, status: :created, location: @hta_monitoring }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hta_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hta_monitorings/1 or /hta_monitorings/1.json
  def update
    respond_to do |format|
      if @hta_monitoring.update(hta_monitoring_params)
        format.html { redirect_to @hta_monitoring, notice: "Hta monitoring was successfully updated." }
        format.json { render :show, status: :ok, location: @hta_monitoring }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hta_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hta_monitorings/1 or /hta_monitorings/1.json
  def destroy
    @hta_monitoring.destroy
    respond_to do |format|
      format.html { redirect_to hta_monitorings_url, notice: "Hta monitoring was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hta_monitoring
      @hta_monitoring = HtaMonitoring.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hta_monitoring_params
      params.require(:hta_monitoring).permit(:patient_id, :tas, :tad, :status, :comments, :user_id)
    end
end
