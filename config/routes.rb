Rails.application.routes.draw do
  root 'home#index'

  # Slug creation
  get '/:id', to: "link#get_slug"
  match '/url/:id', to: "link#create_update_slug", via: [:post, :put]
  match '/url/:id', to: "link#delete_slug", via: [:delete]

  # Error pages
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#server_error", via: :all
  match "/401", to: "errors#not_authorized", via: :all
end
