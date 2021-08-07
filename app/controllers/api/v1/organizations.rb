module API
    module V1
      class Organizations < Grape::API
        include API::V1::Defaults
        resource :organizations do
          desc "Return all organizations"
          get "" do
            organizations = Organization.all

            if organizations.present?
                organizations 
            else
              {status: "empty", message: "Empty"} 
            end
            
          end


          desc "Return by status"
          get "/completed" do 
            
              polls = Poll.where(status: "Terminé") 
              if polls.present?
                polls 
              else
                {status: "empty", message: "Empty"} 
              end

              

          end

          desc "Return by status"
          get "/active/status" do 
            
              polls = Poll.where(status: "En cours") 
              if polls.present?
                polls

              else
                {status: "empty", message: "Empty"}                  
                
              end

              

          end



        desc "Return a Organization"
          params do
            requires :id, type: Integer, desc: "ID of the organization"
          end
          get ":id" do
            Organization.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end