Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/current', to: "contest_boards#current"
      resources :users
      resources :contest_boards, only: [:show] do
        resources :contest_props, only: [:show, :index]
      end
      resources :contest_props
    end
  end
end
