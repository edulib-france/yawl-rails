class Yawl::VisitsController < Ahoy::BaseController
  include Ahoy::Concerns::Authenticate
  include Ahoy::Concerns::SetAndCreate

  private

  def set_resource
    @resource = Ahoy::Visit.new(resource_params.merge(application: @application))
  end

  def resource_params
    visit_params = params.require(:visit)
    visit_token = visit_params[:visit_token]
    raise ActionController::ParameterMissing.new(:visit_token) if visit_token.blank?

    visit_params.permit(
      :app_version,
      :browser,
      :city,
      :country,
      :device_type,
      :ip,
      :landing_page,
      :os,
      :os_version,
      :platform,
      :referrer,
      :referring_domain,
      :region,
      :started_at,
      :user_agent,
      :utm_campaign,
      :utm_content,
      :utm_medium,
      :utm_source,
      :utm_term,
      :visit_token,
      :visitor_token
    )
  end
end
