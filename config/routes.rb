Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # scope defaults: { format: :json } do
  #   devise_for :users, only: []
  # end

  namespace :v1, defaults: { format: "json" } do
    # devise_scope :user do
    #   post "users/sign_in", to: 'sessions#create'
    # end
  end
  resources :secured, only: :index
end
