class WeathersController < ApplicationController
  def index
#    @weather = Weather.new
  end

  def show
    @weather = Weather.new params[:id]
  rescue => e
    p e
    e.backtrace.each {|_e| p _e }
    logger.debug e
    head 404
  end
end
