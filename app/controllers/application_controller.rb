class ApplicationController < ActionController::API
  include ActiveSupport::Rescuable
  include ActionController::MimeResponds, ActionController::ImplicitRender
  include SkipTrackable
  include TokenAuthentication
  include ErrorResponse

  self.responder = ApiResponder

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  respond_to :json
end
