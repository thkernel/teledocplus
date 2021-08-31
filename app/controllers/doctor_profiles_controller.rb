class DoctorProfilesController < ApplicationController

    before_action :authenticate_user!
    layout "dashboard"

    before_action :set_doctor_profile, only: [:show, :edit, :update, :destroy]

    def index 
        
       @doctor_profiles = DoctorProfile.all
        
    end

    def new
        @specialities = Speciality.all
        @countries = Country.all
        @doctor_profile = DoctorProfile.new
    end

    def edit
        @countries = Country.all
        @specialities = Speciality.all
    end

    def add_doctor
        doctor = User.find_by(email: params[:email])
        respond_to do |format|

            if doctor.present?

                if belongs_to_current_structure?(doctor)
                    format.js { flash.now[:alert] = "Ce médecin existe déjà dans votre structure."}

                else
                    work_place = WorkPlace.new
                    work_place.profile_id = doctor.profile.id
                    work_place.user_id =  current_user.id
                    work_place.save

                    WorkPlaceItem.create(structure_id: current_structure.id, work_place_id: work_place.id)
                    
                    structure_doctors(current_structure)
                    format.js { flash.now[:notice] = "Ce médecin a été ajouté dans votre structure."}

                end

            else
                format.js { flash.now[:alert] = "L'adresse email saisie ne correspont a aucun médecin."}
            end
        end
    end


    def create
    #@doctor_profile = current_user.doctor_profiles.build(doctor_profile_params)
      @doctor_profile = DoctorProfile.create(doctor_profile_params)


    respond_to do |format|
      if @doctor_profile.save

        # Create user account
        User.create(userable: @doctor_profile, login: "",  email: @doctor_profile.email,  password: "default@2021", password_confirmation: "default@2021", role_id: Role.find_by(name: "Médecin").id)

        @doctor_profiles = DoctorProfile.all
        format.html { redirect_to @doctor_profile, notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor_profile }
        format.js
      else
        @countries = Country.all
        @specialities = Speciality.all
        format.html { render :new }
        format.json { render json: @doctor_profile.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /localities/1
  # PATCH/PUT /localities/1.json
  def update
    respond_to do |format|
      if @doctor_profile.update(doctor_profile_params)
        @doctor_profiles = DoctorProfile.all
        format.html { redirect_to @doctor_profile, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @locality }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @doctor_profile.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @doctor_profile = DoctorProfile.find(params[:doctor_profile_id])
  end


  # DELETE /localities/1
  # DELETE /localities/1.json
  def destroy
    @doctor_profile.destroy
    
    respond_to do |format|
      format.html { redirect_to doctor_profiles_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
      #format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_profile
      @doctor_profile = DoctorProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_profile_params
      params.require(:doctor_profile).permit(:first_name, :last_name, :civility, :speciality_id, :address, :country_id, :locality,  :email, :phone, :consultation_price)
    end
end
