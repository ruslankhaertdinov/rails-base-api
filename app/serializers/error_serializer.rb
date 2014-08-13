class ErrorSerializer < ApplicationSerializer
  attributes :code, :message, :validations

  private

  def include_validations?
    validations
  end
end
