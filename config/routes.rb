Rails.application.routes.draw do
  root :to => "words#index"
  # Routes for the Author resource:
  # CREATE
  get "/authors/new", :controller => "authors", :action => "new"
  post "/create_author", :controller => "authors", :action => "create"

  # READ
  get "/authors", :controller => "authors", :action => "index"
  get "/authors/:id", :controller => "authors", :action => "show"

  # UPDATE
  get "/authors/:id/edit", :controller => "authors", :action => "edit"
  post "/update_author/:id", :controller => "authors", :action => "update"

  # DELETE
  get "/delete_author/:id", :controller => "authors", :action => "destroy"
  #------------------------------

  # Routes for the Reading_word resource:
  # CREATE
  get "/reading_words/new", :controller => "reading_words", :action => "new"
  post "/create_reading_word", :controller => "reading_words", :action => "create"

  # READ
  get "/reading_words", :controller => "reading_words", :action => "index"
  get "/reading_words/:id", :controller => "reading_words", :action => "show"

  # UPDATE
  get "/reading_words/:id/edit", :controller => "reading_words", :action => "edit"
  post "/update_reading_word/:id", :controller => "reading_words", :action => "update"

  # DELETE
  get "/delete_reading_word/:id", :controller => "reading_words", :action => "destroy"
  #------------------------------

  # Routes for the Reading resource:
  # CREATE
  get "/readings/new", :controller => "readings", :action => "new"
  post "/create_reading", :controller => "readings", :action => "create"

  # READ
  get "/readings", :controller => "readings", :action => "index"
  get "/readings/:id", :controller => "readings", :action => "show"

  # UPDATE
  get "/readings/:id/edit", :controller => "readings", :action => "edit"
  post "/update_reading/:id", :controller => "readings", :action => "update"

  # DELETE
  get "/delete_reading/:id", :controller => "readings", :action => "destroy"
  #------------------------------

  # Routes for the Reader_reading resource:
  # CREATE
  get "/reader_readings/new", :controller => "reader_readings", :action => "new"
  post "/create_reader_reading", :controller => "reader_readings", :action => "create"

  # READ
  get "/reader_readings", :controller => "reader_readings", :action => "index"
  get "/reader_readings/:id", :controller => "reader_readings", :action => "show"

  # UPDATE
  get "/reader_readings/:id/edit", :controller => "reader_readings", :action => "edit"
  post "/update_reader_reading/:id", :controller => "reader_readings", :action => "update"

  # DELETE
  get "/delete_reader_reading/:id", :controller => "reader_readings", :action => "destroy"
  #------------------------------

  # Routes for the Reader_word resource:
  # CREATE
  get "/reader_words/new", :controller => "reader_words", :action => "new"
  post "/create_reader_word", :controller => "reader_words", :action => "create"

  # READ
  get "/reader_words", :controller => "reader_words", :action => "index"
  get "/reader_words/:id", :controller => "reader_words", :action => "show"

  # UPDATE
  get "/reader_words/:id/edit", :controller => "reader_words", :action => "edit"
  post "/update_reader_word/:id", :controller => "reader_words", :action => "update"

  # DELETE
  get "/delete_reader_word/:id", :controller => "reader_words", :action => "destroy"
  #------------------------------

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
