Rails.application.routes.draw do
  root 'pages#index'

  scope :api, defaults: {format: 'json'} do
    resources :users, except: [:new, :edit]
    resources :classroom_periods, except: [:new, :edit]
    get '/users/:id/classroom_periods/', to: 'classroom_periods#schedule'
    get '/classroom_period/:id/', to: 'classroom_periods#listing'
    # resources :courses, except: [:new, :edit]
    # resources :presences, except: [:new, :edit]
    # resources :schedules, except: [:new, :edit]
  end
end
