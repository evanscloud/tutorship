# frozen_string_literal: true

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:github]

  def self.find_or_create_by(payload)
    attrs = extract_from(payload)
    user = User.find_by_github_id(attrs['github_id'])
    if user.nil?
      user = User.create!(attrs)
    else
      user.update_attributes(attrs)
    end
    user
  end

  def self.extract_from(payload)
    {
      'name'          => payload['info']['name'],
      'email'         => payload['info']['email'],
      'login'         => payload['info']['nickname'],
      'github_id'     => payload['uid'].to_i,
      'github_token'  => payload['credentials']['token'],
      'github_url'    => payload['extra']['raw_info']['html_url'],
      'location'      => payload['extra']['raw_info']['location'],
      'avatar_url'    => payload['extra']['raw_info']['avatar_url']
    }
  end

  def to_param
    login
  end
end
