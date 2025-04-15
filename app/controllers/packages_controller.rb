class PackagesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @package = Package.new(package_params)
      @package.status = "pending_unpaid"
      
      if @package.save
        render json: { success: true, package: @package }, status: :created
      else
        render json: { success: false, errors: @package.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def package_params
      params.require(:package).permit(
        :recipient_name, :recipient_phone,
        :sender_agent_id, :delivery_type,
        :location, :receiver_agent_id,
        :courier_service, :destination
      )
    end
  end
  