Rails.application.routes.draw do
  devise_for :users
 root to: "tweets#index" 
 resources :tweets
 resources :users do
  member do
    get 'mypage'
  end
  member do
    get 'detail'
  end
  member do
    get 'lists'
  end
 end
end
