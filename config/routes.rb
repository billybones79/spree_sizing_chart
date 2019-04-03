Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :template_charts
    resources :sizing_charts
    get "template_chart/ajax" => "template_charts#ajax"
  end
end
