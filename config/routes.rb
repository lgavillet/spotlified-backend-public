Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :songs, only: [:show] do
      get 'search(/:search)', action: :search, on: :collection
    end

    resources :artists, only: %i[index show] do
      resources :songs, only: %i[index show]
    end
  end
end
