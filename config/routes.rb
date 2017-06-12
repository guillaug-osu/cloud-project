CloudProject::Application.routes.draw do
  
  namespace :api, :defaults => {format: :json} do
    namespace :v1 do
      resources :api_keys,            only: [:index, :show]
      resources :users
      resources :books
      post  "/users/authenticate",    :to => "users#authenticate"
      post  "/books/search",          :to => "books#search"
    end
  end
  
  root "cloud_project#index"
  
end
