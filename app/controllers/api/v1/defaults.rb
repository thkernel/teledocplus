module API
    module V1
      module Defaults
        extend ActiveSupport::Concern

        included do
          prefix "api"
          version "v1", using: :path
          default_format :json
          format :json
          formatter :json, 
               Grape::Formatter::ActiveModelSerializers
  
=begin
          before do
            error!("401 Unauthorized, 401") unless authenticated
          end
=end          
            
          helpers do
            def permitted_params
              @permitted_params ||= declared(params, 
                 include_missing: false)
            end
  
            def logger
              Rails.logger
            end

            # For auth
            def authenticate!
              error!('Unauthorized. Invalid or expired token.', 401) unless current_user
            end
        
            def current_user
              # find token. Check if valid.
              token = ApiKey.where(access_token: params[:token]).first
              if token && !token.expired?
                @current_user = User.find(token.user_id)
              else
                false
              end
            end
 

            def commenting_another_poll_item?(user_id, poll_item_id )
    is_comment = false
    poll_item = PollItem.find(poll_item_id)

    if poll_item.present?
      poll = Poll.find(poll_item.poll_id)
      if poll.present?
        poll_items = poll.poll_items

        
        poll_items.each do |poll_item|
          comments = poll_item.comments


          comments.each do |comment|
            
            if comment.user_id == user_id && comment.poll_item_id != poll_item_id
              is_comment = true 
            end

            break if is_comment == true
             
          end
          break if is_comment == true
          
        end

        
      end
    end

    if is_comment == true 
      true
    else
      false
    end
  end

  def voting_another_poll_item?(user_id, poll_item_id )
    is_voting = false
    poll_item = PollItem.find(poll_item_id)

    if poll_item.present?
      poll = Poll.find(poll_item.poll_id)
      if poll.present?
        poll_items = poll.poll_items

        
        poll_items.each do |poll_item|
          votings = poll_item.votings


          votings.each do |voting|
            if voting.user_id == user_id && voting.poll_item_id != poll_item_id
             is_voting = true 
            end
            break if is_voting == true
             
          end
          break if is_voting == true
          
        end

        
      end
    end

    if is_voting == true 
      true
    else
      false
    end
  end


  def commenting_current_poll_item?(user_id, poll_item_id )
    is_comment = false
    poll_item = PollItem.find(poll_item_id)

    if poll_item.present?
      poll = Poll.find(poll_item.poll_id)
      if poll.present?
        poll_items = poll.poll_items

        
        poll_items.each do |poll_item|
          comments = poll_item.comments


          comments.each do |comment|
            
            if comment.user_id == user_id && comment.poll_item_id == poll_item_id
              is_comment = true 
            end

            break if is_comment == true
             
          end
          break if is_comment == true
          
        end

        
      end
    end

    if is_comment == true 
      true
    else
      false
    end
  end

  def voting_current_poll_item?(user_id, poll_item_id )
    is_voting = false
    poll_item = PollItem.find(poll_item_id)

    if poll_item.present?
      poll = Poll.find(poll_item.poll_id)
      if poll.present?
        poll_items = poll.poll_items

        
        poll_items.each do |poll_item|
          votings = poll_item.votings


          votings.each do |voting|
            if voting.user_id == user_id && voting.poll_item_id == poll_item_id
             is_voting = true 
            end
            break if is_voting == true
             
          end
          break if is_voting == true
          
        end

        
      end
    end

    if is_voting == true 
      true
    else
      false
    end
  end

      
          
      
          

      
            
          end
  
          rescue_from ActiveRecord::RecordNotFound do |e|
            error_response(message: e.message, status: 404)
          end
  
          rescue_from ActiveRecord::RecordInvalid do |e|
            error_response(message: e.message, status: 422)
          end
        end
      end
    end
  end
  