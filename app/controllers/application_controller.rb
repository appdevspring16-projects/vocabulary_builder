class ApplicationController < ActionController::Base
  before_action :authenticate_reader!

  protect_from_forgery with: :exception
end
