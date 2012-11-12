class WeathersController < ApplicationController
  def index
    @weather = Weather.new
  end
end
