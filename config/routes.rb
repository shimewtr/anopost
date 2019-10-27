# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "postboxs#new"

  get "postboxs/index"
  get "postboxs/show"
  get "postboxs/new"
  get "postboxs/edit"
end
