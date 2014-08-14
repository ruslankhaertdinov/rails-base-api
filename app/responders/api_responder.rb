class ApiResponder < ActionController::Responder
  def api_behavior(error)
    fail(error) unless resourceful?

    if get?
      display resource
    elsif post?
      display resource, status: :created, location: nil
    else
      head :no_content
    end
  end

  def resource_errors
    error = Error.new(code: :validation_error, validations: resource.errors)
    ErrorSerializer.new(error).as_json
  end
end
