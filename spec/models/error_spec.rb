require 'rails_helper'

describe Error do
  describe 'initialize' do
    let(:error) { described_class.new(code: code) }

    context 'bad request' do
      let(:code) { :bad_request }
      let(:message) { 'Bad Request' }

      it_behaves_like 'a correct error'
    end

    context 'validation error' do
      let(:code) { :validation_error }
      let(:message) { 'Validation Error' }

      it_behaves_like 'a correct error'
    end

    context 'not found error' do
      let(:code) { :not_found }
      let(:message) { 'Resource Not Found' }

      it_behaves_like 'a correct error'
    end

    context 'authorization error' do
      let(:code) { :unauthorized }
      let(:message) { 'Authentication Failed' }

      it_behaves_like 'a correct error'
    end
  end
end
