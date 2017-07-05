Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login',  to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  # Temporary move; otherwise foo was taken as username
  resources :foo, controller: 'likes', only: [:index]

  scope ':username' do
    get '', to: 'users#show'
    put '', to: 'users#update'
    delete '', to: 'users#destroy'
    
    resources :transactions, except: [:new, :create] do
      resources :likes, except: [:show, :destroy]
      resources :comments, only: [:create, :update, :destroy]
    end

    post 'pay',    to: 'transactions#pay'
    post 'charge', to: 'transactions#charge'
  end

end
