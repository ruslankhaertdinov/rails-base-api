class ApplicationController < ActionController::API
  # include ActionController::ImplicitRender
  include Knock::Authenticable

  # decent_configuration do
  #   strategy DecentExposure::StrongParametersStrategy
  # end

  respond_to :json
end
