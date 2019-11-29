Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/current', to: "contest_boards#current"
      resources :contest_boards, only: [:show, :index] do
        resources :contest_props, only: [:show, :index]
      end
      resources :contest_props, only: [:index, :show, :new, :create, :edit, :update]
    end
  end
end
