# frozen_string_literal: true

Rails.application.routes.draw do
  scope format: false do
    devise_for :users, path: '/', controllers: {
      omniauth_callbacks: 'sessions'
    }

    as :users do
      get '/users', to: 'users#index', as: 'users'
      get '/users/:id', to: 'users#show', as: 'user'
      delete '/users/:id', to: 'users#destroy'
    end

    root 'users#index'
  end
end
