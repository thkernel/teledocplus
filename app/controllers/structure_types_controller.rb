class StructureTypesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_structure_type, only: [:show, :edit, :update, :destroy]

  # GET /structure_types
  # GET /structure_types.json
  def index
    @structure_types = StructureType.all
  end

  # GET /structure_types/1
  # GET /structure_types/1.json
  def show
  end

  # GET /structure_types/new
  def new
    @structure_type = StructureType.new
  end

  # GET /structure_types/1/edit
  def edit
  end

  # POST /structure_types
  # POST /structure_types.json
  def create
    @structure_type = current_user.structure_types.build(structure_type_params)

    respond_to do |format|
      if @structure_type.save
        @structure_types = StructureType.all

        format.html { redirect_to @structure_type, notice: 'Structure type was successfully created.' }
        format.json { render :show, status: :created, location: @structure_type }
        format.js
      else
        format.html { render :new }
        format.json { render json: @structure_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /structure_types/1
  # PATCH/PUT /structure_types/1.json
  def update
    respond_to do |format|
      if @structure_type.update(structure_type_params)
        @structure_types = StructureType.all

        format.html { redirect_to @structure_type, notice: 'Structure type was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure_type }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @structure_type.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @structure_type = StructureType.find(params[:structure_type_id])
  end

  # DELETE /structure_types/1
  # DELETE /structure_types/1.json
  def destroy
    @structure_type.destroy
    @structure_types = StructureType.all

    respond_to do |format|
      format.html { redirect_to structure_types_url, notice: 'Structure type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure_type
      @structure_type = StructureType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_type_params
      params.require(:structure_type).permit(:name)
    end
end
