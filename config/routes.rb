Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  get '/url/:id', to: "link#get_slug"
  match '/url', to: "link#create_update_slug", via: [:post, :put]
  match '/url/:id', to: "link#delete_slug", via: [:delete]

end
