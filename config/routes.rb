Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login',  to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  resources ':userId', controller: 'users', except: [:create, :index]

  scope ':userId' do
    resources :transactions, except: [:new, :create] do
      resources :likes, except: [:show, :destroy]
      resources :comments, only: [:create, :update, :destroy]
    end

    post 'pay',    to: 'transactions#pay'
    post 'charge', to: 'transactions#charge'
  end

end
