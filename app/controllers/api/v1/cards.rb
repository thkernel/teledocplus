module API
    module V1
      class Cards < Grape::API
        include API::V1::Defaults
        resource :cards do
          desc "Return all cards"
          get "" do
            Card.all
          end

          desc "Return latest cards"
          get "/latest_cards" do
            Card.all
          end


          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/search/:name" do 
              Card.search_by_name(permitted_params[:name]) 

 
          end



        desc "Return a poll_tems"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Card.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end