Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#index'
  resources :posts do
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end
end
