class StructureUsersController < ApplicationController
  before_action :set_structure_user, only: [:show, :edit, :update, :destroy]

  # GET /structure_users
  # GET /structure_users.json
  def index
    @structure_users = StructureUser.all
  end

  # GET /structure_users/1
  # GET /structure_users/1.json
  def show
  end

  # GET /structure_users/new
  def new
    @structure_user = StructureUser.new
  end

  # GET /structure_users/1/edit
  def edit
  end

  # POST /structure_users
  # POST /structure_users.json
  def create
    @structure_user = StructureUser.new(structure_user_params)

    respond_to do |format|
      if @structure_user.save
        format.html { redirect_to @structure_user, notice: 'Structure user was successfully created.' }
        format.json { render :show, status: :created, location: @structure_user }
      else
        format.html { render :new }
        format.json { render json: @structure_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structure_users/1
  # PATCH/PUT /structure_users/1.json
  def update
    respond_to do |format|
      if @structure_user.update(structure_user_params)
        format.html { redirect_to @structure_user, notice: 'Structure user was successfully updated.' }
        format.json { render :show, status: :ok, location: @structure_user }
      else
        format.html { render :edit }
        format.json { render json: @structure_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structure_users/1
  # DELETE /structure_users/1.json
  def destroy
    @structure_user.destroy
    respond_to do |format|
      format.html { redirect_to structure_users_url, notice: 'Structure user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure_user
      @structure_user = StructureUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def structure_user_params
      params.require(:structure_user).permit(:structure_id, :user_id, :status)
    end
end
