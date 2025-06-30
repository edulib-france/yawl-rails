module Ahoy::Concerns::SetAndCreate
  extend ActiveSupport::Concern

  included do
    before_action :set_application
    before_action :set_resource, only: [:create]
  end

  def create
    if @resource.errors.empty? && @resource.save
      render json: {message: "#{@resource.class} created"}, status: :created
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  rescue => e
    render json: {error: e.message}, status: :bad_request
  end

  private

  def set_application
    @application = @usage_data_key.application
  end

  def set_resource
    raise NotImplementedError
  end
end
