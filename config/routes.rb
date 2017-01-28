Rails.application.routes.draw do

  root "site#index"

  resources :owners, except:[:new] do
    resources :pets, only: [:index, :new, :create]
  end
  resources :pets, only: :show


  # These routes will be for signup. The first renders a form in the browser. The second will
  # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'owners#new'
  post '/users' => 'owners#create'    #not sure if this should be '/owner'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


end
