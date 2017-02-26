Rails.application.routes.draw do
  get "home/index"
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  authenticated :user do
    root to: 'home#index', as: :authenticated_root  
  end
  root to: redirect('login')

  resources :users

  resources :quiz_answer_keys do
    member do
      put :add_quiz_item
    end
    collection do
      post :process_add_quiz_item
    end
  end

  resources :quiz_items

  resources :quiz_mode do
    member do
      get :take_quiz
    end
  end
end
