Rails.application.routes.draw do 
		namespace :api, defaults: {format: :json} do 
			resources :dogs
			resources :visits
		end
end