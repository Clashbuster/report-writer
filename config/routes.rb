Rails.application.routes.draw do
  resources :reports
  resources :accidents
  resources :users

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#destroy'
    post '/logout', to: 'sessions#destroy'
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    get '/landing', to: 'sessions#landing'
    post 'reports/new', to: 'reports#create'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
