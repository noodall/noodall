<%= app_const %>.routes.draw do
  devise_for :users
  get 'admin' => 'noodall/admin/nodes#index', :as => 'admin_root'
  namespace :admin do
    resources :users
  end
end

require 'noodall/routes'
Noodall::Routes.draw <%= app_const %>
