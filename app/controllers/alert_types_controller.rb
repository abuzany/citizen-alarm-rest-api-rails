class AlertTypesController < ApplicationController

  def index 
    @AlertsController = AlertTpes.all
    render json: @AlertsController
  end

end
