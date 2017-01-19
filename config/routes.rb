Rails.application.routes.draw do
  # Routes for the Word resource:
  # CREATE
  get "/words/new", :controller => "words", :action => "new"
  post "/create_word", :controller => "words", :action => "create"

  # READ
  get "/words", :controller => "words", :action => "index"
  get "/words/:id", :controller => "words", :action => "show"

  # UPDATE
  get "/words/:id/edit", :controller => "words", :action => "edit"
  post "/update_word/:id", :controller => "words", :action => "update"

  # DELETE
  get "/delete_word/:id", :controller => "words", :action => "destroy"
  #------------------------------

  devise_for :readers
  # Routes for the Reader resource:
  # READ
  get "/readers", :controller => "readers", :action => "index"
  get "/readers/:id", :controller => "readers", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
