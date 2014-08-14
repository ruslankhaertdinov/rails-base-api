#require 'rails_helper'
#
#class ExampleController < ApplicationController
#end
#
#describe ExampleController do
#  context 'when raise bad request error' do
#    controller do
#      def index
#        raise ActionController::BadRequest
#      end
#    end
#
#    it 'renders bad request response' do
#      #expect(controller).to receive(:render_bad_request_error)
#      get :index, format: :json
#      binding.pry
#    end
#  end
#
#  context 'when raise bad request error' do
#    controller do
#      def index
#        raise ActiveRecord::RecordNotFound
#      end
#    end
#
#    it 'renders bad request response' do
#      #expect(controller).to receive(:render_not_found_error)
#      get :index, format: :json
#      binding.pry
#    end
#  end
#
#  context 'when raise bad request error' do
#    controller do
#      def index
#        user = User.new
#        user.save
#        raise ActiveRecord::RecordInvalid.new(user)
#      end
#    end
#
#    it 'renders bad request response' do
#      #expect(controller).to receive(:render_validation_error)
#      #get :index, format: :json
#      #binding.pry
#    end
#  end
#
#  context 'validation error' do
#    controller do
#      def index
#        user = FactoryGirl.create :user
#        user.email = ''
#        user.save
#        respond_with user
#      end
#    end
#
#    it 'renders bad request response' do
#      #expect(controller).to receive(:render_validation_error)
#      post :index, format: :json
#      binding.pry
#    end
#  end
#end
