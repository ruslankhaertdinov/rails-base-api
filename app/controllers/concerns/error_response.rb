module ErrorResponse
  extend ActiveSupport::Concern
  include ActiveSupport::Rescuable

  included do
    rescue_from ActionController::BadRequest do
      render_error(:bad_request)
    end
    rescue_from ActiveRecord::RecordNotFound do
      render_error(:not_found)
    end
  end

  def render_error(code)
    error = Error.new(code: code)

    respond_with error, status: code, serializer: ErrorSerializer
  end
end
