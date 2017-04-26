Rails.application.routes.draw do
  devise_for :users
  resources :jobs do
    member do
      post :join
      post :quit
    end
    resources :resumes
  end

  namespace :account do
     resources :jobs do
       resources :resumes
     end
  end

  namespace :post do
    resources :resumes
  end

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
     end
     resources :resumes
    end
  end
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pages
  resources :groups
end
