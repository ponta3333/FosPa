Rails.application.routes.draw do

  get 'notifications/index'
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
  get 'demand_users/withdraw' => 'demand_users#withdraw'
  patch 'demand_users/out' => 'demand_users#out'
  resources :demand_users, only: [:show, :update] do
    scope module: 'supply_users' do
      get 'chats' => 'chats#new'
    end
  end
  get 'demand_users/demand_users/edit' => 'demand_users#edit'
  get 'supply_users/withdraw' => 'supply_users#withdraw'
  patch 'supply_users/out' => 'supply_users#out'
	resources :supply_users, only: [:show, :index, :update] do
    scope module: 'demand_users' do
      get 'chats' => 'chats#new'
    end
  end
  get 'supply_users/supply_users/edit' => 'supply_users#edit'
  get 'favorites' => 'favorites#index', as: :favorites
  resources :animals do
  	resources :favorites, only: [:create, :destroy]
  end
  resources :genres, only: [:show]
  resources :events
  resources :chats, only: [:create, :index]
  resources :demand_user_notifications, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
