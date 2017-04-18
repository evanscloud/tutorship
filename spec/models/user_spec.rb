# frozen_string_literal: true

require 'rails_helper'

# TODO: remove this function when this PR has been released
# https://github.com/stympy/faker/pull/888
# it should be replaced by Faker::Omniauth.github
# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def github_hash
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

RSpec.describe User, type: :model do
  context 'validations' do
    subject { FactoryGirl.build(:user) }

    # Uniqueness
    it do
      is_expected.to validate_uniqueness_of(:login)
        .case_insensitive
    end
    it do
      is_expected.to validate_uniqueness_of(:github_id)
    end

    # Required fields
    it { is_expected.to validate_presence_of(:login) }
    it { is_expected.to validate_presence_of(:github_id) }
    it { is_expected.to validate_presence_of(:github_token) }
    it { is_expected.to validate_presence_of(:github_url) }
    it { is_expected.to validate_presence_of(:avatar_url) }
  end

  describe '.find_or_create_by' do
    it 'creates a new record if it doesn\'t exist' do
      user = User.find_or_create_by(github_hash)
      expect(user.persisted?).to eq(true)
    end
    it 'returns an existing record details if any' do
      existing_user = FactoryGirl.create(:user)
      payload = github_hash
      payload[:uid] = existing_user.github_id
      user = User.find_or_create_by(payload)
      expect(existing_user).to eq(user)
    end
  end

  describe '.extract_from' do
    let(:payload) do
      # TODO: replace github_hash call with:
      #   Faker::Omniauth.github
      # Refer to github_hash function above for more info
      github_hash
    end

    let(:result) do
      User.extract_from(payload)
    end

    it 'returns valid `name`' do
      expect(result[:name]).to eq(payload[:info][:name])
    end
    it 'returns valid `email`' do
      expect(result[:email]).to eq(payload[:info][:email])
    end
    it 'returns valid `login`' do
      expect(result[:login]).to eq(payload[:info][:nickname])
    end
    it 'returns `github_id` as instance of Integer' do
      expect(result[:github_id]).to be_instance_of(Integer)
    end
    it 'returns `uid` as github_id`' do
      expect(result[:github_id]).to eq(payload[:uid].to_i)
    end
    it 'returns valid `github_token`' do
      expect(result[:github_token]).to eq(payload[:credentials][:token])
    end
    it 'returns valid `github_url`' do
      expect(result[:github_url]).to eq(payload[:info][:urls][:GitHub])
    end
    it 'returns valid `location`' do
      expect(result[:location]).to eq(payload[:extra][:raw_info][:location])
    end
    it 'returns valid `avatar_url`' do
      expect(result[:avatar_url]).to eq(payload[:info][:image])
    end
  end

  describe '#to_param' do
    it 'returns `login` field as parameter' do
      user = FactoryGirl.build(:user)
      expect(user.to_param).to eq(user.login)
    end
  end
end
