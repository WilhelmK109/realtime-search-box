Rails.application.routes.draw do
  root 'search#index'
  post 'search/create', to: 'search#create'
  get 'search/analytics', to: 'search#analytics'
end
