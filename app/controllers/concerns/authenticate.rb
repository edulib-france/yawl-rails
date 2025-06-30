module Ahoy::Concerns::Authenticate
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_with_api_key!, only: [:create]
  end

  private

  def api_key
    request.headers["api-key"]
  end

  def authenticate_with_api_key!
    @usage_data_key = UsageDataKey.find_by(access_key: api_key)
    return unless @usage_data_key.nil?

    render json: {error: "Unauthorized"}, status: :unauthorized
  end
end
