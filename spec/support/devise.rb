# frozen_string_literal: true

OmniAuth.config.test_mode = true
OmniAuth.config.on_failure = proc { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
  'provider' => 'github',
  'uid'      => '911',
  'info' => {
    'email' => 'octokit@example.com',
    'image' => 'http://placehold.it/350x150',
    'name' => '',
    'nickname' => 'octokit'
  },

  'extra' => {
    'raw_info' => {
      'html_url' => 'https://github.com/octokit',
      'location' => 'Github'
    }
  },

  'credentials' => {
    'token' => 'xxxxxxxxxxxxxxxxxx'
  }
)

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end
