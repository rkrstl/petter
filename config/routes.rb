Rails.application.routes.draw do
  devise_for :users

 root to: "tweets#index" 

 resources :tweets do
   resources :likes,only: [:create, :destroy]
   collection do
   get 'lank'
   end
 end

 resources :users do
  member do
    get 'mypage'
  end
  member do
    get 'detail'
  end
  collection do
    get 'lists'
  end
 end

end
