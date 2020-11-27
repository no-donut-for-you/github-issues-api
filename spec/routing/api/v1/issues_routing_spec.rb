# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::IssuesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/issues/rails/rails').to route_to('api/v1/issues#index', username: 'rails', repository: 'rails', format: :json)
    end
  end
end
