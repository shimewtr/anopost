# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "postboxes#new"

  get "/:uid", to: "postboxes#show"

  resources :postboxes, param: :uid
  resources :posts

  post "/session/login", to: "sessions#create"
  delete "/session/logout", to: "sessions#destroy"

  get "/static_pages/about", to: "static_pages#about"
  get "/static_pages/tos", to: "static_pages#tos"
  get "/static_pages/privacy", to: "static_pages#privacy"
end
