module API
    module V1
      class Votings < Grape::API
        include API::V1::Defaults
        resource :votings do
          desc "Return all comments"
          get "" do
            Voting.all
          end


          desc "Return all votes."
          params do
            requires :user_token, type: String, desc: "Password"
          end
          get "/user/:user_token"  do
            api_key = ApiKey.find_by(access_token: params[:user_token])
            puts "API KEY: #{api_key}"
            
            if api_key.present?
              puts "API KEY PRESENT}"
                user = User.find(api_key.user_id)
                
               
                
                if user.present? 
                  puts "USER PRESENT}"
                  votings = user.votings
                   
                  {status: 'ok', votings: votings}
                else
                    {status: "no"}
                end
               

            else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                return
            end
          end


          desc "Create new comment."
          params do
            requires :poll_item_id, type: Integer, desc: "Username or email address"
            requires :user_token, type: String, desc: "Password"
          end
          post :new do
            
            user = ApiKey.find_by(access_token: params[:user_token])
            
            
            if user.present?
                voting = Voting.new
                voting.poll_item_id = params[:poll_item_id]
                
                voting.user_id = user.user_id
                
                if voting.save!
                
                   
                  {status: 'ok', voting: voting}
                else
                    {status: "no"}
                end
               

            else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                return
            end
          end

      

          desc "Return a comment"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Voting.where(id: permitted_params[:id]).first!
          end

        end
      end
    end
  end