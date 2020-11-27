# frozen_string_literal: true

module Github
  class Client
    include Github::Client::Issues

    def client
      @client ||= Faraday.new(ENV['GITHUB_API_URL']) do |c|
        c.adapter Faraday.default_adapter
        c.request :json
        c.response :json
      end
    end
  end
end
