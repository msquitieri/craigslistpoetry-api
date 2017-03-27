# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

    def connect
      # api_key = request.params[:api_key]
      #
      # if api_key.nil? || ApiPartner.find_by_api_key(api_key).nil?
      #   reject_unauthorized_connection and return
      # end

      self.uuid = SecureRandom.uuid
    end
  end
end
