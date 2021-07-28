Rails.application.routes.draw do
  devise_for :users,
    path: 'users',
    path_names: {
      sign_up: '',
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup',
    },
    conrollers: {
      registrations: "users/registrations",
      sessions: "users/sessions"
    }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  resources :posts, except: [:index]
end
