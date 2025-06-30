class Yawl::EventsController < Ahoy::BaseController
  include Ahoy::Concerns::Authenticate
  include Ahoy::Concerns::SetAndCreate

  private

  def set_resource
    @resource = Ahoy::Event.new(resource_params)
    @resource.visit = Ahoy::Visit.find_by(visit_token:) if visit_token
    @resource.article = Article.find_by(isbn:) if isbn
    @resource.establishment_account = EstablishmentAccount.find_by(id: resource_params[:establishment_account_id])
  end

  def visit_token
    params.dig(:event, :visit_token)
  end

  def isbn
    params.dig(:event, :ean)
  end

  def resource_params
    params
      .require(:event)
      .permit(
        :establishment_account_id,
        :name,
        :time,
        :user_type,
        properties: {}
      )
  end
end
