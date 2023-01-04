Rails.application.routes.draw do

    #管理者アカウント
    devise_for :admins, controllers: {
      registrations: 'admins/registrations',
      sessions: 'admins/sessions'
    }

    resources :admins, only: [:show]

    root to: 'columns#index' #トップページ

    resources :columns

    #get '*path', controller: 'application', action: 'render_404'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
