# frozen_string_literal: true

require 'rails_helper'

describe AuthHash do
  let(:mock_hash) { OmniAuth.config.mock_auth[:github] }
  let(:auth_hash) { described_class.new(mock_hash) }

  describe '#token' do
    it 'extracts the user token' do
      expect(auth_hash.token).to eq(mock_hash['credentials']['token'])
    end
  end
  describe '#uid' do
    it 'extracts the user id as integer' do
      expect(auth_hash.uid).to eq(mock_hash['uid'].to_i)
    end
  end
  describe '#login' do
    it 'extracts the user login' do
      expect(auth_hash.login).to eq(mock_hash['info']['nickname'])
    end
  end
  describe '#user_info' do
    let(:auth_hash) { described_class.new(mock_hash).user_info }

    it 'extracts the user login' do
      expect(auth_hash[:login]).to eq(mock_hash['info']['nickname'])
    end
    it 'extracts the user id as integer' do
      expect(auth_hash[:github_id]).to eq(mock_hash['uid'].to_i)
    end
    it 'extracts the user token' do
      expect(auth_hash[:github_token]).to eq(
        mock_hash['credentials']['token']
      )
    end
    it 'extracts the user name' do
      expect(auth_hash[:name]).to eq(mock_hash['info']['name'])
    end
    it 'extracts the user HTML URL' do
      expect(auth_hash[:github_url]).to eq(
        mock_hash['extra']['raw_info']['html_url']
      )
    end
    it 'extracts the user avatar URL' do
      expect(auth_hash[:avatar_url]).to eq(
        mock_hash['info']['image']
      )
    end
    it 'extracts the user location' do
      expect(auth_hash[:location]).to eq(
        mock_hash['extra']['raw_info']['location']
      )
    end
  end
end
