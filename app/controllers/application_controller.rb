class ApplicationController < ActionController::API
  include ActionController::MimeResponds, ActionController::ImplicitRender
  include SkipTrackable
  include TokenAuthentication

  self.responder = ApiResponder

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  respond_to :json

  resque_from ActionController::BadRequest, with: render_bad_request_error
  rescue_from ActiveRecord::RecordNotFound, with: render_not_found_error
  rescue_from ActionController::RoutingError, with: render_internal_error

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  protected

  def render_unprocessible_entity_error(errors)
    error_info = { message: 'Unprocessible entity', errors: errors, status: 422 }

    render_error(erro_info)
  end

  def render_bad_request_error
    error_info = { message: 'Bad request', status: 401 }

    render_error(erro_info)
  end

  def render_not_found_error
    error_info = { message: 'Entity not found', status: 404 }

    render_error(erro_info)
  end

  def render_internal_erorr
    error_info = { message: 'Internal server error', status: 500}

    render_error(error_info)
  end

  def render_error(error_info)
    error_info[:trace] = e.backtrace[0,10] if Rails.env.development?

    render json: error_info
  end
end
