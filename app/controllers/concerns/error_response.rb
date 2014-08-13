module ErrorResponse
  extend ActiveSupport::Concern
  include ActiveSupport::Rescuable

  ERROR_CODES = {
    bad_request: 400,
    unauthorized: 401,
    not_found: 404,
    validation_error: 422
  }

  included do
    rescue_from ActionController::BadRequest, with: :render_bad_request_error
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error
    rescue_from ActiveRecord::RecordInvalid, with: :render_validation_error
  end

  def render_bad_request_error
    error_info = { message: 'Bad Request', code: :bad_request}

    render_error(error_info)
  end

  def render_not_found_error
    error_info = { message: 'Resource Not Found', code: :not_found }

    render_error(error_info)
  end

  def render_validation_error(invalid)
    error_info = { message: 'Validation Error', validations: invalid.record.errors, code: :validation_error }

    render_error(error_info)
  end

  def render_error(error_info)
    status = ERROR_CODES[error_info[:code]]

    respond_with Error.new(error_info), status: status
  end
end
