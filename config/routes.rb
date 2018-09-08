Rails.application.routes.draw do
  post 'check_asin', to: 'static_pages#check_asin'
  root 'static_pages#home'
end