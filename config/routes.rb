Rails.application.routes.draw do

	root 'home#top'
	get 'about' => 'home#about'

  devise_for :demand_users, controllers: {
    sessions: 'demand_users/sessions',
    passwords: 'demand_users/passwords',
    registrations: 'demand_users/registrations'
  }
  devise_for :supply_users, controllers: {
    sessions: 'supply_users/sessions',
    passwords: 'supply_users/passwords',
    registrations: 'supply_users/registrations'
  }
  resources :demand_users, only: [:show, :edit, :update]
  get 'demand_users/withdraw' => 'demand_users#withdraw'
	patch 'demand_users/out' => 'demand_users#out'
	resources :supply_users, only: [:show, :index, :edit, :update]
  get 'supply_users/withdraw' => 'supply_users#withdraw'
	patch 'supply_users/out' => 'supply_users#out'
  resources :animals do
  	resources :bleeds, only: [:create, :update] do
  		resources :genres, only: [:create, :update]
  	end
  	resources :favorites, only: [:create, :destroy]
  end
  resources :events
  resources :chats, only: [:show, :create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
