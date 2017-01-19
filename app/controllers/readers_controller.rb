class ReadersController < ApplicationController
  def index
    @readers = Reader.page(params[:page]).per(10)
  end

  def show
    @reader = Reader.find(params[:id])
  end
end
