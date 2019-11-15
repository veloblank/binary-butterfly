Rails.application.routes.draw do
  resources :contest_props
  namespace :api do 
    namespace :v1 do 
      resources :contest_weeks
    end
  end
end
