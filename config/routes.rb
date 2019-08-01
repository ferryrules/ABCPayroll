Rails.application.routes.draw do
  root 'companies#_home'

  get '/analytics', to:'companies#analytics'
  get '/payrolls/analytics', to: 'payrolls#analytics'
  get '/payrolls/:id/analytics', to: 'payrolls#analytics_show', as: "analytics_show"
  get '/payrolls/:id/submit', to: 'payrolls#submit', as: 'payroll_submit'

  resources :sessions, only: :create
  get 'signup', to: 'companies#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  match 'active'  => 'sessions#active',  via: :get
  match 'timeout' => 'sessions#timeout', via: :get

  post '/paychecks/adjustment', to: "paychecks#new_adjustment", as: "new_paych_adj"
  delete '/paychecks/adjustment/:id', to: "paychecks#destroy_adjustment"

  post '/employees/adjustment', to: "employees#new_adjustment", as: "new_emp_adj"
  delete '/employees/adjustment/:id', to: "employees#destroy_adjustment"

  resources :companies
  resources :payrolls
  resources :paychecks
  resources :employees
  resources :adjustments, except: [:show, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
