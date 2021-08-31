class DiabeteMonitoringsController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"
  
  before_action :set_diabete_monitoring, only: %i[ show edit update destroy ]

  # GET /diabete_monitorings or /diabete_monitorings.json
  def index
    @diabete_monitorings = DiabeteMonitoring.all
  end

  # GET /diabete_monitorings/1 or /diabete_monitorings/1.json
  def show
  end

  # GET /diabete_monitorings/new
  def new
    @diabete_monitoring = DiabeteMonitoring.new
  end

  # GET /diabete_monitorings/1/edit
  def edit
  end

  # POST /diabete_monitorings or /diabete_monitorings.json
  def create
    @diabete_monitoring = DiabeteMonitoring.new(diabete_monitoring_params)

    respond_to do |format|
      if @diabete_monitoring.save
        format.html { redirect_to @diabete_monitoring, notice: "Diabete monitoring was successfully created." }
        format.json { render :show, status: :created, location: @diabete_monitoring }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diabete_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diabete_monitorings/1 or /diabete_monitorings/1.json
  def update
    respond_to do |format|
      if @diabete_monitoring.update(diabete_monitoring_params)
        format.html { redirect_to @diabete_monitoring, notice: "Diabete monitoring was successfully updated." }
        format.json { render :show, status: :ok, location: @diabete_monitoring }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @diabete_monitoring.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diabete_monitorings/1 or /diabete_monitorings/1.json
  def destroy
    @diabete_monitoring.destroy
    respond_to do |format|
      format.html { redirect_to diabete_monitorings_url, notice: "Diabete monitoring was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diabete_monitoring
      @diabete_monitoring = DiabeteMonitoring.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def diabete_monitoring_params
      params.require(:diabete_monitoring).permit(:uid, :patient_id, :glycemie_a_jeun, :sueurs, :sensation_de_faim, :tremblement, :vertige, :irritabilite, :polyurie_majoree, :fatigue_majoree, :amaigrissement, :comments, :status, :user_id)
    end
end
