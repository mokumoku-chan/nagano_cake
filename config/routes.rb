Rails.application.routes.draw do


  scope module: :public do
    root to: 'homes#top'

    get '/about' => 'homes#about'

    get '/customers/mypage' => 'customers#show'
    # get '/customers/unsubscribe' => 'customers#unsubscribe'
    # patch '/customers/withdraw' => 'customers#withdraw'


    resource :customers, only: [:show, :edit, :update] do

      member do
        get :unsubscribe
        # post :withdraw
        patch :withdraw
      end
    end

    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :create]
    resources :cart_items, only: [:index, :create, :edit, :update, :destroy] do

      collection do
        delete :destroy_all
      end
    end
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
