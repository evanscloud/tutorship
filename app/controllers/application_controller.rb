# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(_res)
    request.env['omniauth.origin'] || root_url
  end

  def after_sign_out_path_for(_res)
    root_url
  end
end
