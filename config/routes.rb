# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "postboxes#new"

  resources :postboxes, param: :uid
  resources :posts

  post "/login", to: "sessions#create"
end
