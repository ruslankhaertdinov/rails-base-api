class Error
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :code, :message, :validations
end
