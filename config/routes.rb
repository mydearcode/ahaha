Rails.application.routes.draw do
  
  
  resources :categories
  get 'questions/completed_questions' 
  get 'users/index'
  get 'users/show'
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
  confirmations:      'devise_token_auth/confirmations',
  passwords:          'devise_token_auth/passwords',
  omniauth_callbacks: 'devise_token_auth/omniauth_callbacks',
  registrations:      'devise_token_auth/registrations',
  sessions:           'devise_token_auth/sessions',
  token_validations:  'devise_token_auth/token_validations'
}
  resources :questions do 
     
    resources :answers do
      member do
        
        put :select_answer
      end
    end
  end
  resources :users
  
end
