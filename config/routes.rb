Rails.application.routes.draw do
  get "home/index"
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  authenticated :user do
    root to: 'home#index', as: :authenticated_root  
  end
  root to: redirect('login')

  resources :users
end
