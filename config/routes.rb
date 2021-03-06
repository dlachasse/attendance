Rails.application.routes.draw do
  root 'pages#index'

  scope :api, defaults: {format: 'json'} do
    resources :users, except: [:new, :edit]
    resources :classroom_periods, except: [:new, :edit]
    get '/users/:id/classroom_periods/', to: 'classroom_periods#schedule'
    get '/classroom_period/:id/', to: 'classroom_periods#listing'
    get '/classroom_periods/:id/attendance', to: 'presences#show'
    get '/classroom_periods/:id/attendance/:date', to: 'presences#class_by_date'
    get '/attendance(/:date)', to: 'presences#by_date'
    # resources :courses, except: [:new, :edit]
    # resources :presences, except: [:new, :edit]
    # resources :schedules, except: [:new, :edit]
  end
end
