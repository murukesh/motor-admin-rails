# frozen_string_literal: true

module Motor
  class RunQueriesController < ApiBaseController
    load_and_authorize_resource :query, only: :show, parent: false

    before_action :build_query, only: :create
    authorize_resource :query, only: :create

    def show
      render json: query_result_hash(query_result)
    end

    def create
      render json: query_result_hash(query_result)
    end

    private

    def query_result
      Queries::RunQuery.call(@query)
    end

    def query_result_hash(query_result)
      {
        data: query_result.data,
        meta: {
          columns: query_result.columns
        }
      }
    end

    def build_query
      @query = Motor::Queries.build_from_params(query_params)
    end

    def query_params
      params.require(:data).permit(:sql_body, preferences: {})
    end
  end
end
