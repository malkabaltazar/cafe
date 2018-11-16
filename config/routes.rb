Rails.application.routes.draw do
  root to: 'static_pages#home'
  devise_for :entities, controllers: {
    confirmations: 'entity/confirmations',
    passwords: 'entity/passwords',
    registrations: 'entity/registrations',
    sessions: 'entity/sessions',
    unlocks: 'entity/unlocks'
  }
end
