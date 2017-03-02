Rails.application.routes.draw do
	get '/', to: 'mailings#index'

	resources :people
	resources :mailings
	get 'mailings/:id/print', to: 'mailings#print'
	post 'mailings/:mailing_id/recd/:person_id', to: 'mailings#log_recd'
	delete 'mailings/:mailing_id/recd/:person_id', to: 'mailings#clear_log_recd'

end
