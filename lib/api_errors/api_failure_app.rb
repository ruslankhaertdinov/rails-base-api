class ApiFailureApp < Devise::FailureApp
  def http_auth_body
    error = Error.new(code: :unauthorized, message: i18n_message)
    ErrorSerializer.new(error).to_json
  end
end
