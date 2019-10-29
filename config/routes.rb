# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "postboxes#new"

  get "/:uid", to: "postboxes#show"
  post "posts/:uid", to: "postboxes#create"

  resources :posts
  resources :postboxes, param: :uid
end
