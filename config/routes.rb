# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "postboxes#new"

  get "/:uid", to: "postboxes#show"

  resources :postboxes, param: :uid
  resources :posts

  post "/session/login", to: "sessions#create"
  delete "/session/logout", to: "sessions#destroy"
end
