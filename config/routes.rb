Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'api' do
    namespace :v1 do
      resources :users
      resources :health_records do
        match :batch_create, via: [:post],  on: :collection
      end
    end
  end
end
