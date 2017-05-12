# frozen_string_literal: true

Rails.application.routes.draw do
  scope format: false do
    devise_for :users, path: '/', controllers: {
      omniauth_callbacks: 'sessions'
    }

    devise_scope :user do
      get 'users', to: 'users#index', as: 'users'
      get '@:login', to: 'users#show', as: 'profile'
      delete '@:login', to: 'users#destroy'

      get 'login', to: redirect('/auth/github'), as: 'login'
      get 'logout', to: 'sessions#logout', as: 'logout'
    end

    root 'users#index'
  end
end
