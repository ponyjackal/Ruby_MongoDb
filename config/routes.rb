Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users do
        collection do
          post 'login'
          post 'signup'
          delete 'logout'
        end
      end
      resources :leads
    end
  end
end
