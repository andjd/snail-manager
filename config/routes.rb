Rails.application.routes.draw do
	get '/', to: 'mailings#index'

	resources :people
	resources :mailings
end
