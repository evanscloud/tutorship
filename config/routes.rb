# frozen_string_literal: true

Rails.application.routes.draw do
  scope format: false do
    devise_for :users, path: '/', controllers: {
      omniauth_callbacks: 'users/sessions'
    }

    devise_scope :user do
      get 'users', to: 'users#index', as: 'users'
      get '@:login', to: 'users#show', as: 'user'
      delete '@:login', to: 'users#destroy'
      get 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
    end

    root 'users#index'
  end
end
