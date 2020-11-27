# frozen_string_literal: true

module Api
  module V1
    class IssuesController < ApplicationController
      # Get issues from a repository endpoint
      # example List issues for a repository
      #
      # GET api/v1/issues/rails/rails?assignee=none&direction=desc
      def index
        client = Github::Client.new
        issues = client.issues(params[:username], params[:repository], filter_options)

        if issues.success?
          render json: issues.body, status: :ok
        else
          render json: issues.body['message'], status: issues.status
        end
      end

      private

      def filter_options
        permited_params = %i[
          format
          username
          repository
          sort
          since
          direction
          state
          assignee
          labels
        ]

        params.permit(permited_params)
      end
    end
  end
end
