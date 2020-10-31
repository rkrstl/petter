Rails.application.routes.draw do
  devise_for :users

  
 post '/tweets/guest_sign_in', to: 'tweets#new_guest'
 
 root to: "tweets#index"


 resources :plans
 resources :relationships,only: [:create, :destroy] 
 resources :pets do
   collection do
    get 'search'
   end
  end
 resources :animal_types
 resources :tweets do
   resources :likes,only: [:create, :destroy]
   resources :comments,only: [:create]
   collection do
   get 'lank'
   end
 end

 resources :users do
  member do
    get 'following'
  end
  member do
    get 'follower'
  end
  member do
    get 'mypage'
  end
  member do
    get 'detail'
  end
  collection do
    get 'lists'
  end
  member do 
    get 'likes'
  end
 end

 

end
