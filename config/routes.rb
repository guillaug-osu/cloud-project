Rails.application.routes.draw do
  
  namespace :api, :defaults => {format: :json} do
    namespace :v1 do
      resources :boats
      resources :slips
    end
  end
  
  root "rest_planning#index"
  
end
