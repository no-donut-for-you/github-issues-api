# frozen_string_literal: true

require 'json'

module Github
  class Client
    # Methods for the Issues API
    #
    # @see https://developer.github.com/v3/issues/
    module Issues
      # List issues from a repository
      #
      # it returns a Faraday Response
      #
      # param username [String] A GitHub username.
      # param repository [String] A GitHub repository name.
      # options option [String] :sort (created) sort: created, updated, or comments.
      # options option [String] :since This is a timestamp in ISO 8601 format: YYYY-MM-DDTHH:MM:SSZ.
      # options option [String] :direction (desc) Direction: asc or desc.
      # options option [String] :state (open ) Indicates the state of the issues to return. Can be either open, closed, or all.
      # options option [String] :assignee Can be the name of a user. Pass in none for issues with no assigned user, and * for issues assigned to any user.
      # options option [String] :labels List of comma separated Label names. Example: actionCable, actionMailer.
      # options option [Integer] :page List of comma separated Label names. Example: actionCable, actionMailer.
      # options option [Integer] :per_page List of comma separated Label names. Example: actionCable, actionMailer.
      #
      # example List issues for a repository
      # options = {
      #     sort: 'comments',
      #     since: '2020-11-24T14:01:58+00:00',
      #     direction: 'desc',
      #     state: 'open',
      #     assignee: 'none',
      #     labels: 'activerecord',
      #     page: 1, 
      #     per_page: 100
      #   }
      #
      #   issues = client.issues('rails', 'rails', options)
      def list_issues(username, repository, options = {})
        url = "/repos/#{username}/#{repository}/issues"
        url = "#{url}?#{options.to_query}" unless options.empty?

        client.get url
      end

      alias issues list_issues
    end
  end
end
