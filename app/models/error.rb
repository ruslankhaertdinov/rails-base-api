class Error
  include ActiveModel::Model
  include ActiveModel::Serialization

  MESSAGES = {
    bad_request: 'Bad Request',
    not_found: 'Resource Not Found',
    validation_error: 'Validation Error',
    unauthorized: 'Authentication Failed'
  }

  attr_accessor :code, :message, :validations

  def initialize(params = {})
    super
    self.message = MESSAGES[code]
  end

  alias_method :attributes, :instance_values
end
