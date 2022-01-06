Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    collection do
      get :new_user_skills
      post :create_user_skills

      get :new_user_jobs
      post :create_user_jobs
    end
    member do
      get :show
      patch :update_users
      get :dashboard
    end

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers, only: [:index, :show] do
    resources :matches, only: [:update]
  end
end
