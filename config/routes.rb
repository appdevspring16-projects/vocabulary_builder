Rails.application.routes.draw do
  devise_for :readers
  # Routes for the Reader resource:
  # READ
  get "/readers", :controller => "readers", :action => "index"
  get "/readers/:id", :controller => "readers", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
