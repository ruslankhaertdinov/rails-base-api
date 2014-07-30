class Error
  include ActiveModel::Model
  attr_accessor :code, :message, :validation_errors
end
