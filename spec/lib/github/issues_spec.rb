# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Github::Client::Issues, type: :lib do
  before do
    @client = Github::Client.new
    stub_request(:get, url)
  end

  describe '.issues' do
    let(:base_url) { ENV['GITHUB_API_URL'] }
    let(:username) { 'rails' }
    let(:repository) { 'rails' }

    context 'without options' do
      let(:url) { "#{base_url}/repos/#{username}/#{repository}/issues" }

      it 'calls a faraday .get with a correct url without options' do
        @client.issues(username, repository)

        expect(a_request(:get, url)).to have_been_made.once
      end
    end

    context 'with options' do
      let(:options) do
        {
          sort: 'comments',
          since: '2020-11-24T14:01:58+00:00',
          direction: 'desc',
          state: 'open',
          assignee: 'none',
          labels: 'activerecord'
        }
      end
      let(:url) { "#{base_url}/repos/#{username}/#{repository}/issues?#{options.to_query}" }

      it 'calls a faraday .get with a correct url with options' do
        @client.issues(username, repository, options)

        expect(a_request(:get, url)).to have_been_made.once
      end
    end
  end
end
