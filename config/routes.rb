Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  get '/url/:id', to: "application#get_hash"
  match '/url', to: "application#create_hash", via: [:post]
  match '/url/:id', to: "application#delete_hash", via: [:delete]

end
