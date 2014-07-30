class ErrorSerializer < BaseSerializer
  attributes :code, :message, :validation_errors
end
