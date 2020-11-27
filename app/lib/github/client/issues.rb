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
      # @param repo [String] A GitHub repository name.
      # @option options [String] :labels List of comma separated Label names. Example: <tt>ActionCable, ActionMailer</tt>.
      # @option options [String] :sort (created) Sort: <tt>created</tt>, <tt>updated</tt>, or <tt>comments</tt>.
      # @option options [String] :direction (desc) Direction: <tt>asc</tt> or <tt>desc</tt>.
      # @option options [Integer] :page (1) Page number.
      # @example List issues for a repository
      #   issues = client.issues('rails/rails')
      def list_issues(username, repository, options = {})
        url = "/repos/#{username}/#{repository}/issues"
        url = "#{url}?#{options.to_query}" unless options.empty?

        client.get url
      end

      alias issues list_issues
    end
  end
end
