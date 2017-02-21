module Api
	module V2
		class AlertsController < ApplicationController
			#before_action :authenticate_user!

			# Return the las 200 alerts reported today
			def today
				render json: Alert.created_today.limit(200)
			end

			# Return the las 200 alerts reported this month
			def monthly
				render json: Alert.created_monthly.limit(200)
			end

			# Return the las 200 alerts reported this week
			def weekly
				render json: Alert.created_monthly.limit(200)
			end

			# Return the las 200 user alerts reported this month
			def user_today
				render json: Alert.created_today.where(
					user_id: params[:user_id]
				).limit(200)
			end

			# Return the las 200 user alerts reported this month
			def user_monthly
				render json: Alert.created_monthly.where(
					user_id: params[:user_id]
				).limit(200)
			end

			# Return the las 200 user alerts reported this week
			def user_weekly
				render json: Alert.created_weekly.where(
					user_id: params[:user_id]
				).limit(200)
			end

			# Return all alerts
			def index
				render json: Alert.all
			end

			# Retunr an specific alert
			def show
				render json: Alert.find(params[:id])
			end

			# Create a new alert
			def create
				render json: Alert.create(alert_params)
			end

			# Udate an alert
			def udate
				render json: Alert.update(params[:id], params[:alert])
			end

			# Delete an alert
			def dstroy
				render json: Alert.destroy(params[:id])
			end

			# Parasm allowed for alert from request
			def alert_params
				params.require(:alert).permit(:user_id,
																			:alert_type_id,
																			:description,
																			:latitude,
																			:longitude)
			end

		end
	end
end
