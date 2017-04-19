# frozen_string_literal: true

# Put common used functions for testing here
module Helper
  # TODO: remove this function when this PR has been released
  # https://github.com/stympy/faker/pull/888
  # it should be replaced by Faker::Omniauth.github
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  def fake_github
    uid = Faker::Number.number(8)
    name = Faker::Name.name
    first_name = Faker::Name.first_name.downcase
    last_name  = Faker::Name.last_name.downcase
    login = "#{first_name}-#{last_name}"
    html_url = "https://github.com/#{login}"
    api_url = "https://api.github.com/users/#{login}"
    email = "#{first_name}@example.com"

    {
      provider: 'github',
      uid: uid,
      info: {
        nickname: login,
        email: email,
        name: name,
        image: Faker::Placeholdit.image,
        urls: {
          GitHub: html_url
        }
      },
      credentials: {
        token: Faker::Crypto.md5,
        expires:  false
      },
      extra: {
        raw_info: {
          login: login,
          id: uid,
          avatar_url: Faker::Placeholdit.image,
          gravatar_id: '',
          url: api_url,
          html_url: html_url,
          followers_url: "#{api_url}/followers",
          following_url: "#{api_url}/following{/other_user}",
          gists_url: "#{api_url}/gists{/gist_id}",
          starred_url: "#{api_url}/starred{/owner}{/repo}",
          subscriptions_url: "#{api_url}/subscriptions",
          organizations_url: "#{api_url}/orgs",
          repos_url: "#{api_url}/repos",
          events_url: "#{api_url}/events{/privacy}",
          received_events_url: "#{api_url}/received_events",
          type: 'User',
          site_admin:  false,
          name: name,
          company: nil,
          blog: nil,
          location: Faker::Address.country,
          email: email,
          hireable: nil,
          bio: nil,
          public_repos: Faker::Number.number(4),
          public_gists: Faker::Number.number(4),
          followers: Faker::Number.number(4),
          following: Faker::Number.number(4),
          created_at: Faker::Time.backward(364_00).iso8601,
          updated_at: Faker::Time.backward(2).iso8601
        }
      }
    }
  end
end

RSpec.configure do |config|
  config.include Helper
end
