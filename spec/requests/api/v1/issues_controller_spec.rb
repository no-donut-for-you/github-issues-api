# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/v1/issues', type: :request do
  describe 'GET /index', :vcr do
    context 'fail to get issues from a repository' do
      let(:username) { 'fakerails' }
      let(:repository) { 'fakerails' }

      it 'returns errors' do
        get api_v1_issues_url(username, repository), as: :json

        expect(response).to_not be_successful
        expect(response.body).to eql 'Not Found'
      end
    end

    context 'success to get issues from a repository' do
      let(:username) { 'rails' }
      let(:repository) { 'rails' }
      let(:options) do
        {
          sort: 'comments',
          since: '2020-11-24T14:01:58+00:00',
          direction: 'desc',
          state: 'open',
          assignee: 'none',
          labels: 'activerecord',
          page: 1, 
          per_page: 100
        }
      end
      let(:body) { JSON.parse(response.body) }

      it 'returns all issues from a repository' do
        get api_v1_issues_url(username, repository), as: :json

        expect(response).to be_successful
        expect(body).to be_kind_of Array
      end

      it 'returns all filtered issues from a repository' do
        get api_v1_issues_url(username, repository, options), as: :json

        expect(response).to be_successful
        expect(body).to be_kind_of Array

        issue = body.first
        labels = issue['labels'].map { |label| label['name'] }

        expect(labels).to include 'activerecord'
        expect(issue['state']).to eql 'open'
        expect(issue['assignee']).to be_nil
      end
    end
  end
end
