# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback

unless Role.all.present?
    roles = Role.create(
        [
            {name: "superuser"},
            {name: "Administrateur"},
            {name: "Assistant"},
            {name: "Manager"},
            {name: "Patient"},
            {name: "Médecin"},
            {name: "Structure"},
            
            
        ])
else
    roles = Role.all

end


#Profiles
unless UserProfile.all.present?
profiles = UserProfile.create([
    {
        first_name: "Amos", 
        last_name: "DEMBELE"
    },
    {
        first_name: "Admin", 
        last_name: "Admin"
    },
    {
        first_name: "Fréderic", 
        last_name: "KOLANE"
    }
])
else
    profiles = UserProfile.all
end


# Users
unless User.all.present?

    users = User.create([
        {userable: profiles[0], login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "superuser").id},
        {userable: profiles[1],login: "admin", email: "teledocplus@gmail.com", password: "Root@2021@#!*", password_confirmation: "Root@2021@#!*", role_id: Role.find_by(name: "superuser").id},
        {userable: profiles[2],login: "kolane",  email: "kolanefrederic@gmail.com",  password: "Root@2021@#!*", password_confirmation: "Root@2021@#!*", role_id: Role.find_by(name: "Administrateur").id}
    
    ])

    
    #User.create(, login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "superuser").id)
    #users = User.all
else

     users = User.all
end


#Country
unless Country.all.present?
    countries = Country.create([
        {
            name: "Mali", 
            user_id: users.first.id,
            
             
        },
        {
            name: "Togo", 
            user_id: users.last.id,
            
        },
        {
            name: "Bénin", 
            user_id: users.last.id,
            
        }
    
    ])
else  
    countries = Country.all

end






#Strcuture types
unless StructureType.all.present?
    structure_types = StructureType.create(
        [
            {name: "Laboratoire", user_id: users.last.id},
            {name: "Hôpital", user_id: users.last.id},
            {name: "Clinique", user_id: users.last.id},
            {name: "Polyclinique", user_id: users.last.id},
            {name: "Centre de radiologie", user_id: users.last.id},
            {name: "Cabinet médical", user_id: users.last.id}

            
          


        ])
else
    structure_types = StructureType.all

end


#Specialities
unless Speciality.all.present?
    speciality = Speciality.create(
        [
            {name: "Acuponcteur", user_id: users.last.id},
            {name: "Anesthésiste-réanimateur", user_id: users.last.id},
            {name: "Infirmier", user_id: users.last.id},
            {name: "Onco-pédiatre", user_id: users.last.id},
            {name: "Audioprothésiste", user_id: users.last.id},
            {name: "Cardiologue", user_id: users.last.id},
            {name: "Chiropracteur", user_id: users.last.id}, 
            {name: "Chirurgien", user_id: users.last.id}, 
            {name: "Chirurgien-dentiste", user_id: users.last.id}, 
            {name: "Dermatologue", user_id: users.last.id}, 
            {name: "Diététicien", user_id: users.last.id}, 
            {name: "Dentiste", user_id: users.last.id}, 
            {name: "Ergothérapeute", user_id: users.last.id}, 
            {name: "Gynécologue-obstétricien", user_id: users.last.id}, 
            {name: "Kinésithérapeute", user_id: users.last.id},
            {name: "Médecin généraliste", user_id: users.last.id}, 
            {name: "Médecin légiste", user_id: users.last.id}, 
            {name: "Ophtalmologue", user_id: users.last.id}, 
            {name: "Opticien-lunetier", user_id: users.last.id}, 
            {name: "Orthésiste", user_id: users.last.id}, 
            {name: "Orthophoniste", user_id: users.last.id}, 
            {name: "Orthoptiste", user_id: users.last.id}, 
            {name: "Ostéopathe", user_id: users.last.id}, 
            {name: "Pédiatre", user_id: users.last.id}, 
            {name: "Pédicure-podologue", user_id: users.last.id}, 
            {name: "Pédopsychiatre", user_id: users.last.id}, 
            {name: "Pharmacien", user_id: users.last.id}, 
            {name: "Psychanalyste", user_id: users.last.id}, 
            {name: "Psychiatre", user_id: users.last.id}, 
            {name: "Psychologue", user_id: users.last.id}, 
            {name: "Psychomotricien", user_id: users.last.id}, 
            {name: "Puériculteur", user_id: users.last.id}, 
            {name: "Radiologue", user_id: users.last.id}, 
            {name: "Sage-Femme", user_id: users.last.id}, 
            {name: "Pneumologue", user_id: users.last.id}, 
            {name: "Chirurgien-Pédiatre", user_id: users.last.id}, 
            {name: "Neurologue", user_id: users.last.id}, 
            {name: "Néphrologue", user_id: users.last.id}, 
            {name: "Urologue", user_id: users.last.id}, 
            {name: "Urgentiste", user_id: users.last.id}, 
            {name: "Gastro-entérologue", user_id: users.last.id}, 
            {name: "Médecin interniste", user_id: users.last.id}, 
            {name: "Diabétologue", user_id: users.last.id}, 
            {name: "Hématologue", user_id: users.last.id}, 
            {name: "Neurochirurgien", user_id: users.last.id}, 
            {name: "Médecin de famille", user_id: users.last.id}, 
            {name: "Traumatologue", user_id: users.last.id}, 
            {name: "Rhumatologue", user_id: users.last.id}, 
            {name: "Médecin communautaire", user_id: users.last.id}
             





            
          


        ])
else
    specialities = Speciality.all

end











