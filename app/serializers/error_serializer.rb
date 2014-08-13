class ErrorSerializer < ActiveModel::ArraySerializer
  attributes :code, :message, :validations
end
