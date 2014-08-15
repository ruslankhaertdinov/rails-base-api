RSpec::Matchers.define :be_an_error_representation do |error|
  match do |json|
    response_attributes = error.attributes
    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
