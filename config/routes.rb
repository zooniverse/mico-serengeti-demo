Rails.application.routes.draw do
  resources :subjects do
    member do
      post :mico_submit
      post :mico_update
    end
  end
end
