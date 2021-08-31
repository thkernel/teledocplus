class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]
  layout "dashboard"
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = UserProfile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = UserProfile.new
  end

  # GET /profiles/1/edit
  def edit

    @profile.build_address  || @profile.address

    puts "EDIT: #{@address.inspect}"
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = UserProfile.new(user_profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(user_profile_params)
        format.html { redirect_to  edit_account_path(current_user.user_profile.uid), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      if params[:uid].present?
        @profile = UserProfile.find_by(uid: params[:uid])
        puts "PROFILE: #{@profile.inspect}"
      else  
        @profile = UserProfile.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:first_name, :last_name, :gender,  :about, :avatar,  address_attributes: [:id, :address_1, :phone_1, :neighborhood,:country, :city, :zip_code, :street, :door])
    end
end
