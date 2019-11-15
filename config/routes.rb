Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do 
      resources :contest_weeks
    end
  end
end
