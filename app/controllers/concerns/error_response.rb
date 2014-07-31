module ErrorResponse
  extend ActiveSupport::Concern
  extend ActiveSupport::Rescuable::ClassMethods

  ERROR_CODES = {
    bad_request: 400,
    unauthorized: 401,
    not_found: 404,
    validation_error: 422,
    internal: 500,
  }

  rescue_from ActionController::RoutingError, with: :render_internal_error
  rescue_from ActionController::BadRequest, with: :render_bad_request_error
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error

  def render_validation_error(error)
    error_info = { message: 'Validation Error', validations: errors, code: :validation_error }

    render_error(erro_info)
  end

  def render_bad_request_error
    error_info = { message: 'Bad Request', code: :bad_request}

    render_error(erro_info)
  end

  def render_not_found_error
    error_info = { message: 'Resource Not Found', code: :not_found }

    render_error(erro_info)
  end

  def render_internal_erorr
    error_info = { message: 'Internal Server Error', code: :internal}

    render_error(error_info)
  end

  def render_error(error_info)
    status = ERROR_CODES[error_info[:code]]

    render json: Error.new(error_info), status: status
  end
end
