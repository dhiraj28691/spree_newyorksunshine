require 'mailchimp'

module Spree

  class SubscribeController < Spree::BaseController

    def process_form
      # API KEY faada70691cbc2771e9a5572328fb333-us5

      @mc = Mailchimp::API.new('faada70691cbc2771e9a5572328fb333-us5')
      @list_id = "751a74e967"


      email = params[:email]

      merge_vars = {
        'EMAIL' => email
      }

      errors = Array.new

      if !email.blank?
        begin
          @mc.lists.subscribe(@list_id, { 'email' => email}, merge_vars)

        rescue Mailchimp::ListAlreadySubscribedError
          errors.push "#{email} is already subscribed"

        rescue Mailchimp::Error => ex
          if ex.message
            errors.push ex.message
          else
            errors.push "An unknown error occurred"
          end
        end

      else
        errors.push "Please enter a valid email address"

      end

      response = {
        'data'=> merge_vars,
        'errors'=> errors
      }

      # puts params
      # @params = params.to_json
      render :json => response
    end

  end

end