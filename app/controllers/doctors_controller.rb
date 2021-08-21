class DoctorsController < ApplicationController

    before_action :authenticate_user!
    layout "dashboard"

    before_action :set_patient, only: [:show, :edit, :update, :destroy]

    def index 
        
       @doctors = Doctor.all
        
    end

    def new
        @specialities = Speciality.all
        @countries = Country.all
        @doctor = Doctor.new
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
    @doctor = current_user.doctors.build(doctor_params)

    respond_to do |format|
      if @doctor.save
        @doctors = Doctor.all
        format.html { redirect_to @doctor, notice: 'Locality was successfully created.' }
        format.json { render :show, status: :created, location: @locality }
        format.js
      else
        @countries = Country.all
        @specialities = Speciality.all
        format.html { render :new }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /localities/1
  # PATCH/PUT /localities/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        @doctors = Doctor.all
        format.html { redirect_to @doctor, notice: 'Locality was successfully updated.' }
        format.json { render :show, status: :ok, location: @locality }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @doctor = Doctor.find(params[:doctor_id])
  end


  # DELETE /localities/1
  # DELETE /localities/1.json
  def destroy
    @doctor.destroy
    
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @locality = Locality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:first_name, :last_name, :civility, :speciality_id, :address, :country_id, :email, :phone, :consultation_price)
    end
end
