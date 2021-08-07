class ActivityFieldsController < ApplicationController
   before_action :authenticate_user!
   layout "dashboard"
  before_action :set_activity_field, only: %i[ show edit update destroy ]

  # GET /activity_fields or /activity_fields.json
  def index
    @activity_fields = ActivityField.all
  end

  # GET /activity_fields/1 or /activity_fields/1.json
  def show
  end

  # GET /activity_fields/new
  def new
    @activity_field = ActivityField.new
  end

  # GET /activity_fields/1/edit
  def edit
  end

  # POST /activity_fields or /activity_fields.json
  def create
    @activity_field = current_user.activity_fields.build(activity_field_params)

    respond_to do |format|
      if @activity_field.save
        @activity_fields = ActivityField.all
        format.html { redirect_to @activity_field, notice: "Activity field was successfully created." }
        format.json { render :show, status: :created, location: @activity_field }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity_field.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /activity_fields/1 or /activity_fields/1.json
  def update
    respond_to do |format|
      if @activity_field.update(activity_field_params)
        @activity_fields = ActivityField.all
        format.html { redirect_to @activity_field, notice: "Activity field was successfully updated." }
        format.json { render :show, status: :ok, location: @activity_field }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity_field.errors, status: :unprocessable_entity }
      end
    end
  end


 def delete
      @activity_field = ActivityField.find(params[:activity_field_id])
    end
  # DELETE /activity_fields/1 or /activity_fields/1.json
  def destroy
    @activity_field.destroy
    respond_to do |format|
      format.html { redirect_to activity_fields_url, notice: "Activity field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_field
      @activity_field = ActivityField.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_field_params
      params.require(:activity_field).permit(:name, :description, :status, :user_id)
    end
end
