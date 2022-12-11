Rails.application.routes.draw do
  #使用者アカウント
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]

  root to: 'top#index' #トップページ

  resources :estimates do
   collection do
    post :confirm
    post :thanks
   end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
