Rails.application.routes.draw do
   root 'welcome#index'

  resources :employees
  get '/edit_password'    => 'employees#edit_password'
  get '/send_reset_email' => 'employees#send_reset_email'
  # put 'employees/update_password' => 'employees#update_password'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
