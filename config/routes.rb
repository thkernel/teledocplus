Rails.application.routes.draw do


  resources :appointments do    
    get "delete"
  end

  resources :specialities do    
    get "delete"
  end

  resources :countries do    
    get "delete"
  end

   resources :structure_types do    
    get "delete"
  end

  resources :heart_failure_monitorings, path: "heart-failure-monitorings" do    
    get "delete"
  end

  resources :hta_monitorings , path: "hta-monitorings" do    
    get "delete"
  end
  resources :diabete_monitorings, path: "diabete-monitorings" do    
    get "delete"
  end

  resources :medication_schedules , path: "medication-schedules" do    
    get "delete"
  end 

  resources :prescription_items
  resources :prescriptions do    
    get "delete"
  end

  resources :patient_profiles, path: "patients" do    
    get "delete"
  end


  
  
  resources :doctor_profiles, path: "doctors" do    
    get "delete"
  end

  resources :structure_profiles, path: "structures" do    
    get "delete"
  end

  

  resources :organizations  do    
    get "delete"
  end
  resources :smtp_configs
  resources :organization_types  do    
    get "delete"
  end
  resources :subscriptions  do    
    get "delete"
  end
  
  
  
  resources :activity_fields do    
    get "delete"
  end
  
  resources :permission_items do    
    get "delete"
  end
  resources :features do    
    get "delete"
  end
  

  
  
 
  
  resources :addresses do    
    get "delete"
  end
  
  # Home route.
  root to: "front#home"

  
  get '/robots.:format' => 'pages#robots'
  get '/ads.:format' => 'pages#ads'


  # Named routes.
  get "/home" => "front#home"
  get "/dashboard" => "dashboard#index", as: :dashboard
  get "/landing" => "pages#landing_page", as: :landing_page
  get "/inquiry-success" => "inquiry_forms#success", as: :inquiry_success
  get "/contact-success" => "contact_forms#success", as: :contact_success
  get "ad/success" => "ads#success", as: :ad_success
  get "/subscription-success" => "subscriptions#success", as: :subscription_success

  get "/suscribe" => "pages#newsletter_suscribe", as: :suscribe
  get "/post/:slug" => "blog#show", as: :post_show
  
  get "/search" => "searches#search_properties", as: :search_properties
  
  get "/about-us" => "pages#about_us", as: :about_us
  get "/how-it-work" => "pages#how_it_work", as: :how_it_work
  get "/cgu" => "pages#cgu", as: :cgu
  get "/join-us" => "pages#join_us", as: :join_us
  get "/contact" => "pages#contact", as: :contact
  get "/advertise" => "pages#advertise", as: :advertise
  get "/blog"  => "blog#index", as: :blog
  get "/faq" => "pages#faq", as: :faq
  get "/privacy-policy" => "pages#privacy_policy", as: :privacy_policy
  get "/partenaires" => "pages#partenaires", as: :partnaires
  
  #get '/inquiry_form' => 'contact_email#inquiry', as: :inquiry_email
  #get "/properties/all" => "front#properties", as: :load_all_properties
  get "/profile/:login/edit" => "profile#edit", as: :user_profile
  get 'users/edit' => 'users/registrations#edit', as:  :edit_user_registration
  #get "search" => "properties#search", as: :search_properties
  get "/user/enable/:id" => "custom_users#get_enable", as: :get_enable_user_account
	post "/user/enable/:id" => "custom_users#post_enable", as: :post_enable_user_account
	get "/user/disable/:id" => "custom_users#get_disable", as: :get_disable_user_account
  post "/user/disable/:id" => "custom_users#post_disable", as: :post_disable_user_account
  

  get "/users"     => "custom_users#index", as: :all_users 
  get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 
  post "/users/new"     => "custom_users#create", as: :create_user
  get "/users/new"     => "custom_users#new", as: :new_user
  get "/user/edit/:id" => "custom_users#edit", as: :edit_user
  patch "/user/update/:id" => "custom_users#update", as: :udapte_user
  delete "/user/destroy/:id" => "custom_users#destroy", as: :destroy_user
  get "/user/delete/:id" => "custom_users#delete", as: :delete_user


  get "/patients"     => "patients#index", as: :all_patients 
  #get "/users/unregistered"     => "custom_users#unregistered", as: :unregistered_commission_percentage 
  post "/patients/new"     => "patients#create", as: :create_patient
  #get "/patients/new"     => "patients#new", as: :new_patient
  #get "/patient/edit/:id" => "patients#edit", as: :edit_patient
  patch "/patient/update/:id" => "patients#update", as: :udapte_patient
  delete "/patient/destroy/:id" => "patients#destroy", as: :destroy_patient
  get "/patient/delete/:id" => "patoents#delete", as: :delete_patient

 
  
  scope "account" do 
    resources :profiles 
    get "profile/:uid" => "profiles#edit", as: :edit_account
  end
  #devise_for :users
  resources :permission_roles do 
    get "delete"
  end
  resources :permissions do 
    get "delete"
  end
  resources :roles do 
    get "delete"
  end

  devise_for :users, path: '', controllers: { 
    registrations: "users/registrations",
    confirmations: 'users/confirmations',
    passwords: "users/passwords",
    sessions: "users/sessions"
        
    }, 
    path_names: {
        sign_in: 'login', 
        sign_out: 'logout', 
        password: 'secret', 
        confirmation: 'verification', 
        unlock: 'unblock', 
        registration: 'signup', 
        sign_up: '' 
  }

  devise_scope :user do
    #root to: "users/sessions#new"
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end
 
  # Dynamic error pages
  get "/404", to: "errors#not_found"
  get "/422", to: "errors#unacceptable"
  get "/500", to: "errors#internal_error"
  mount Ckeditor::Engine => '/ckeditor'


  # For mobile API Endpoint
  mount API::Base, at: "/"

end
