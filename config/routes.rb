Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



  # make sure this is below other rotes
  get '*path', to: "static_pages#frontend_index"
end
