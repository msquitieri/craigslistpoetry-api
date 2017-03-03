Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :poems, only: [:index, :show, :create]
      resources :lines, only: [:index, :show, :update]
    end
  end

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
