Rails.application.routes.draw do
  root 'home#index'

  get '/url/:id', to: "link#get_slug"
  match '/url', to: "link#create_update_slug", via: [:post, :put]
  match '/url/:id', to: "link#delete_slug", via: [:delete]

end
