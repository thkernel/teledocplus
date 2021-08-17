class DoctorsController < ApplicationController
    def index 
        
        structure_doctors(current_structure)
        render layout: "dashboard"
    end

    def new
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
end
