Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users,
              path: '',
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
  root to: "rooms#index"

  resources :rooms do
    resource :roomusers
    resource :chats
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
