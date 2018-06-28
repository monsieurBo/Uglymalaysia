class DevicesController < ApplicationController
  before_action :set_device
  def new
    @device = Device.new
  end

  def create
     if @device.nil? || @device.created_at > 15.minutes.ago
       @device = Device.create(device_params)
     end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find_by(ip: remote_ip())
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.permit(:ip, :isp, :city, :state, :country, :postcode, :latitude, :longitude, :user_id)
    end
end
