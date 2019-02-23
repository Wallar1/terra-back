Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sites/with_pos', to: 'sites#with_pos'
  resources :sites
end
