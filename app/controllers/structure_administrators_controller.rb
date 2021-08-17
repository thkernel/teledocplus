class StructureAdministratorsController < ApplicationController
  before_action :set_structure_administrator, only: [:show, :edit, :update, :destroy]

  # GET /structure_administrators
  # GET /structure_administrators.json
  def index
    @structure_administrators = StructureAdministrator.all
  end

  # GET /structure_administrators/1
  # GET /structure_administrators/1.json
  def show
  end

  # GET /structure_administrators/new
  def new
    @structure_administrator = StructureAdministrator.new
  end

  # GET /structure_administrators/1/edit
  def edit
  end

  # POST /structure_administrators
  # POST /structure_administrators.json
  def create
    @structure_administrator = StructureAdministrator.new(structure_administrator_params)

    respond_to do |format|
      if @structure_administrator.save
        format.html { redirect_to @structure_administrator, notice: 'Structure administrator was successfully created.' }
        format.json { render :show, status: :created, location: @structure_administrator }
      else
        format.html { render :new }
        format.json { render json: @structure_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structure_administrators/1
  # PATCH/PUT /structure_administrators/1.json
  def update
    respond_to do |format|
      if @structure_administrator.update(structure_administrator_params)
        format.html { redirect_to @structure_administrator, notice: 'Structure administrator was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure_administrator }
      else
        format.html { render :edit }
        format.json { render json: @structure_administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structure_administrators/1
  # DELETE /structure_administrators/1.json
  def destroy
    @structure_administrator.destroy
    respond_to do |format|
      format.html { redirect_to structure_administrators_url, notice: 'Structure administrator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure_administrator
      @structure_administrator = StructureAdministrator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_administrator_params
      params.require(:structure_administrator).permit(:structure_id, :profile_id, :administrator, :user_id)
    end
end
