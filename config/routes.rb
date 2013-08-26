Mealprice::Application.routes.draw do
  root 'places#index'
  resources :places do
    resources :menu_items, except: [:index], shallow: true
  end
end
