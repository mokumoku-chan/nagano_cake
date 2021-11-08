Rails.application.routes.draw do


  scope module: :public do
    root to: 'homes#top'

    get '/about' => 'homes#about'
  end


  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :new, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end


  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
