class StructureProfilesController < ApplicationController
  before_action :set_structure_profile, only: [:show, :edit, :update, :destroy]

  # GET /structure_profiles
  # GET /structure_profiles.json
  def index
    @structure_profiles = StructureProfile.all
  end

  # GET /structure_profiles/1
  # GET /structure_profiles/1.json
  def show
  end

  # GET /structure_profiles/new
  def new
    @structure_profile = StructureProfile.new
  end

  # GET /structure_profiles/1/edit
  def edit
  end

  # POST /structure_profiles
  # POST /structure_profiles.json
  def create
    @structure_profile = StructureProfile.new(structure_profile_params)

    respond_to do |format|
      if @structure_profile.save
        format.html { redirect_to @structure_profile, notice: 'Structure profile was successfully created.' }
        format.json { render :show, status: :created, location: @structure_profile }
      else
        format.html { render :new }
        format.json { render json: @structure_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structure_profiles/1
  # PATCH/PUT /structure_profiles/1.json
  def update
    respond_to do |format|
      if @structure_profile.update(structure_profile_params)
        format.html { redirect_to @structure_profile, notice: 'Structure profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure_profile }
      else
        format.html { render :edit }
        format.json { render json: @structure_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structure_profiles/1
  # DELETE /structure_profiles/1.json
  def destroy
    @structure_profile.destroy
    respond_to do |format|
      format.html { redirect_to structure_profiles_url, notice: 'Structure profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure_profile
      @structure_profile = StructureProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_profile_params
      params.require(:structure_profile).permit(:structure_id, :profile_id, :status)
    end
end
