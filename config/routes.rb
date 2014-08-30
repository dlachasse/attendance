Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    resources :presences, except: [:new, :edit]
    resources :schedules, except: [:new, :edit]
    resources :classroom_periods, except: [:new, :edit]
    resources :courses, except: [:new, :edit]
    resources :users, except: [:new, :edit]
  end
end
