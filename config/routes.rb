Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    mount VandalUi::Engine, at: '/vandal'

    resources :users

    resources :projects do
      member do
        get :stats
      end
    end

    resources :tasks do
      member do
        post :complete
      end
    end

    resources :comments

    resources :tags
  end
end