class UsersController < ApplicationController
    def check_username
      input = params[:username].parameterize
      available = !User.exists?(username: input)
  
      if available
        render json: { available: true, username: input }
      else
        suggestion = generate_unique_username(input)
        render json: { available: false, suggestion: suggestion }
      end
    end
  
    private
  
    def generate_unique_username(base)
      loop do
        suffix = rand(1000..9999).to_s
        candidate = "#{base}#{suffix}"
        break candidate unless User.exists?(username: candidate)
      end
    end
  end
  