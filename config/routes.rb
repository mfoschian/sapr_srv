Rails.application.routes.draw do
	# DEFAULT
	root 'home#index'
	
	resources :pilots
	resources :activities
	resources :missions
	resources :equipment_types
	resources :equipments
	resources :equipment_types
	resources :uav
	
end
