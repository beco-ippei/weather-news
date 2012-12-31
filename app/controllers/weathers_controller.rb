class WeathersController < ApplicationController
  def index
    @weather = Weather.new
  end

  def show
    @weather = Weather.new params[:id]
  rescue e
    head 404
  end
end
