Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  get '/url/:id', to: "application#get_slug"
  match '/url', to: "application#create_slug", via: [:post]
  match '/url/:id', to: "application#delete_slug", via: [:delete]

end
