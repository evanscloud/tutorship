# frozen_string_literal: true

Rails.application.routes.draw do
  scope format: false do
    devise_for :users, path: '/', controllers: {
      omniauth_callbacks: 'users/sessions'
    }

    get '/login', to: redirect('/auth/github'), as: 'login'

    devise_scope :user do
      get 'users', to: 'users#index', as: 'users'
      get '@:login', to: 'users#show', as: 'profile'
      delete '@:login', to: 'users#destroy'
      get 'logout', to: 'users/sessions#logout', as: 'logout'
    end

    root 'users#index'
  end
end
