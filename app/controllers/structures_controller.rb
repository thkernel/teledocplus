class StructuresController < ApplicationController
  before_action :authenticate_user!, only: [:new, :delete, :update]
  layout "dashboard"

  before_action :set_structure, only: [:show, :edit, :update, :destroy]

  # GET /structures
  # GET /structures.json
  def index
    @structures = []
    structures = current_user.profile.structures
    puts "MES STRUCTURES: #{structures.inspect}"
    if is_superuser?(current_user) || is_administrator?(current_user)
      @structures = Structure.all
    elsif is_structure_admin?
      @structures.push(current_structure)
    elsif structures.present?
      @structures = structures
    end

  end

  # GET /structures/1
  # GET /structures/1.json
  def show
    @doctors = @structure.profiles
    puts "DOCTORS: #{@doctors.inspect}"
    views = 0
    views = @structure.views + 1
    @structure.update_column(:views, views)
    render layout: "front"
  end

  def type_filter 
    @structure_type = StructureType.find(params[:id])
    @structures = Structure.where(structure_type_id: params[:id])
    render layout: "front"
  end

  # GET /structures/new
  def new
    @localities = Locality.all
    @countries = Country.all

    @structure_types = StructureType.all
    @structure = Structure.new
   
  end

  # GET /structures/1/edit
  def edit
    @localities = Locality.all
    @countries = Country.all
    @structure_types = StructureType.all

  end

  # POST /structures
  # POST /structures.json
  def create
    @structure = current_user.structures.build(structure_params)

    respond_to do |format|
      if @structure.save
        @structures = Structure.all

        format.html { redirect_to @structure, notice: 'Structure was successfully created.' }
        format.json { render :show, status: :created, location: @structure }
        format.js
      else
        format.html { render :new }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /structures/1
  # PATCH/PUT /structures/1.json
  def update
    respond_to do |format|
      if @structure.update(structure_params)
        @structures = current_user.structures

        format.html { redirect_to @structure, notice: 'Structure was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @structure = Structure.find(params[:structure_id])
  end


  # DELETE /structures/1
  # DELETE /structures/1.json
  def destroy
    @structure.destroy
    @structures = current_user.structures

    respond_to do |format|
      format.html { redirect_to structures_url, notice: 'Structure was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure
      @structure = Structure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_params
      params.require(:structure).permit(:structure_type_id, :name, :slogan, :address, :full_address, :street, :phone, :country_id, :locality_id, :email, :web, :latitude, :longitude, :description, :status, :logo)
    end
end
