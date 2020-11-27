Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'issues/:username/:repository', to: 'issues#index', as: 'issues'
    end
  end
end
