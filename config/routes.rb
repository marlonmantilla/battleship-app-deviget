Rails.application.routes.draw do
  
  root 'games#index'

  resources :games, only: [:show, :index] do
    member do
      post :ready
    end
    resources :attacks

    get :reset, on: :collection
  end

  resources :boards, only: [] do
    member do 
      post :set_ship
    end
  end

end
