Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Users
    # Friends

  # Transactions
    # Likes
    # Comments
  resources :users, except: [:new, :create] do
    resources :transactions, except: [:new, :create] do
      resources :comments, only: [:create, :update, :destroy]
      # resources :likes, only: [:create, :update, :destroy]
    end
  end

  resources :likes


  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  post ':userId/payments', to: 'transactions#pay'
  post ':userId/charges', to: 'transactions#charge'
end
