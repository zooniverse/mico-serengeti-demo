require "que/web"

Rails.application.routes.draw do
  mount Que::Web => "/que"

  resources :subjects do
    member do
      post :mico_submit
    end
  end

  root to: "subjects#index"
end
