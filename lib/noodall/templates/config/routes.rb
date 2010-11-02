<%= app_const %>.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
  end
end

require 'noodall/routes'
Noodall::Routes.draw <%= app_const %>::Application
