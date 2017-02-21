module Api
	module V1
		class AlertsController < ApplicationController
			class Alert < ::Alert
				def as_json		(options = {})
					super.merge(description: updated_at.to_s)
				end
			end

			def index
				render json: Alert.all 
			end

			def show
				render json: Alert.find(params[:id])
			end

			def create
				render json: Alert.create(params[:alert])
			end


			def udate
				render json: Alert.update(params[:id], params[:alert])
			end

			def dstroy
				render json: Alert.destroy(params[:id])	
				render json: Alert.destroy(params[:id])	
			end

		end
	end
end