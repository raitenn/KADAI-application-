Rails.application.routes.draw do
root 'home#top'
get 'home/abaut'


devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  get 'home/mypage' => "books#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :books
	resources :users

resources :users, only: [:show, :edit]
 end
