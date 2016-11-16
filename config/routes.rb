Rails.application.routes.draw do
	get '/', to: 'mailings#index'

	resources :people
	resources :mailings
	get 'mailings/:id/print', to: 'mailings#print'
end
