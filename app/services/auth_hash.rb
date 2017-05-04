# frozen_string_literal: true

class AuthHash
  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def token
    @auth_hash[:credentials][:token]
  end

  def uid
    @auth_hash[:uid].to_i
  end

  def login
    @auth_hash[:info][:nickname]
  end

  def user_info
    {
      name:         @auth_hash[:info][:name],
      email:        @auth_hash[:info][:email],
      login:        login,
      avatar_url:   @auth_hash[:info][:image],
      github_id:    uid,
      github_token: token,
      github_url:   @auth_hash[:extra][:raw_info][:html_url],
      location:     @auth_hash[:extra][:raw_info][:location]
    }
  end
end
