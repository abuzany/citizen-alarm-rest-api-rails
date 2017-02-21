
require 'api_constraints'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
  	scope module: :v1, constraints: ApiConstraints.new(version: 1) do
  		resources :alerts, :alert_types
  	end
  	scope module: :v2, constraints: ApiConstraints.new(version: 2, default: true) do
  		resources :alerts, :alert_types
      get 'alerts/reported/today', to: 'alerts#today'
      get 'alerts/reported/monthly', to: 'alerts#monthly'
      get 'alerts/reported/weekly', to: 'alerts#weekly'
      get 'alerts/reported/today/user/:user_id', to: 'alerts#user_today'
      get 'alerts/reported/monthly/user/:user_id', to: 'alerts#user_monthly'
      get 'alerts/reported/weekly/user/:user_id', to: 'alerts#user_weekly'
  	end
  end
end
