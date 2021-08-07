module API
    module V1
      class Base < Grape::API

        mount API::V1::Auth
        mount API::V1::Signup
        mount API::V1::Users
        mount API::V1::Sessions
        mount API::V1::Portfolios
        mount API::V1::Organizations
        mount API::V1::Cards
        mount API::V1::Comments
        mount API::V1::Votings
       

      end
    end
end
  