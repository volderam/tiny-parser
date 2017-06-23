Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #API routes
	namespace :api, defaults: { format: :json } do
		scope module: :v1 do
			resources :pages, :only => [:index, :create]
		end
	end
end
