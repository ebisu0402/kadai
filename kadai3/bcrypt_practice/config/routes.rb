Rails.application.routes.draw do
  root 'homes#index'  

  # サインアップ
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # ログイン / ログアウト
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # マイページ
  get '/mypage', to: 'users#show'
end
