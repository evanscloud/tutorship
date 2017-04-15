# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users').to route_to('users#index')
    end

    it 'routes to #show' do
      expect(get: '/@a').to route_to('users#show', login: 'a')
    end

    it 'routes to #destroy' do
      expect(delete: '/@a').to route_to('users#destroy', login: 'a')
    end
  end
end
