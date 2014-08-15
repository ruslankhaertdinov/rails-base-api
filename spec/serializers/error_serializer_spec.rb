require 'rails_helper'

describe ErrorSerializer do
  let(:code) { :bad_request }
  let(:error) { Error.new(code: code) }
  let(:json) { ErrorSerializer.new(error).to_json }
  let(:error_json) { parse_json(json)['error'] }

  it 'returns user' do
    expect(error_json).to be_an_error_representation(error)
  end
end
