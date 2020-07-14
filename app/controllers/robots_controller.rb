class RobotsController < ApplicationController

  def index
    begin
      @input = "Undefined"
      @input = params[:input] if params.has_key?(:input)
      @result = "Undefined"
      @result = ToyMovement.calculate_move(@input) if @input != "Undefined"
    rescue Exception => e
      @result = e.message
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
