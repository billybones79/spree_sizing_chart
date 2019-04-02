Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :sizing_charts
  end
end
