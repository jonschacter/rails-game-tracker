Rails.application.routes.draw do
    root to: 'sessions#welcome'

    resources :users, only: [:create]
    resources :games do
        resources :game_sessions
    end

    get 'signup', to: 'users#new'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    get 'logout', to: 'sessions#destroy'

end
