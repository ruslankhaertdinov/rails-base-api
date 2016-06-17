class SecuredController < ApplicationController
  before_action :authenticate_user

  def index
    puts current_user.email
    render json: { email: current_user.email }
    # render json: { a: "b" }
  end
end
