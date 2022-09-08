Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/media', to: 'media_process#receive'
    end
  end
end
