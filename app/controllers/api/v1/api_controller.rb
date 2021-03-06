class Api::V1::ApiController < ApplicationController
  before_action :check_api_key

  rescue_from Exception, with: :handle_exceptions

  protected

  def render_bad_request(root, message)
    render_message(root, message, 400)
  end

  def render_unauthorized(root, message)
    render_message(root, message, 401)
  end

  def render_message(root, message, status)
    render json: { root => { message: message } }, status: status
  end

  private

  def handle_exceptions(error)
    case error.class.name
      when 'ActiveRecord::RecordNotFound'
        render_message(:error, 'Record not found.', 404)
      else
        if Rails.env.production?
          render_message(:error, 'An unexpected error occurred', 500)
        else
          raise error
        end
    end
  end

  def check_api_key
    partner = nil

    if passed_api_key.present?
      partner = ApiPartner.where(api_key: passed_api_key).first
    end

    unless partner.present?
      render_unauthorized(:auth, 'Invalid API key')
    end
  end

  def passed_api_key
    params[:api_key] || request.headers['X-api-key']
  end
end