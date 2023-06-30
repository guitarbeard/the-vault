Rails.application.routes.draw do
  scope :api do 
    resources :fragrances
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "react#index"
end
