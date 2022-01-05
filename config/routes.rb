Rails.application.routes.draw do
	# DEFAULT
	root 'home#index'
	
	resources :pilots
	resources :activities
	resources :missions
	resources :equipment_types
	resources :equipments do
		collection do
			put 'batch_update', action: 'batch_update'
		end
	end
	resources :equipment_types
	resources :uav

	get '/reports/test', to: 'reports#test'
end
