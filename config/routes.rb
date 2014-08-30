Rails.application.routes.draw do
  scope :api, defaults: {format: 'json'} do
    resources :users, except: [:new, :edit]
    resources :classroom_periods, except: [:new, :edit]
    # resources :courses, except: [:new, :edit]
    # resources :presences, except: [:new, :edit]
    # resources :schedules, except: [:new, :edit]
  end
end
