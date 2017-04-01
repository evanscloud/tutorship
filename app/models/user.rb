class User < ApplicationRecord
  has_many :identities

  def self.create_with_omniauth(info)
    create(name: info['name'],
           login: info['nickname'],
           email: info['email'],
           location: info['location'])
  end
end
