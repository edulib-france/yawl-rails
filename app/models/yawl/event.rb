# == Schema Information
#
# Table name: ahoy_events
#
#  id                       :bigint           not null, primary key
#  name                     :string
#  properties               :jsonb
#  time                     :datetime
#  user_type                :string
#  article_id               :bigint
#  establishment_account_id :bigint
#  visit_id                 :bigint
#
# Indexes
#
#  index_ahoy_events_on_article_id                (article_id)
#  index_ahoy_events_on_establishment_account_id  (establishment_account_id)
#  index_ahoy_events_on_name_and_time             (name,time)
#  index_ahoy_events_on_properties                (properties) USING gin
#  index_ahoy_events_on_visit_id                  (visit_id)
#
class Yawl::Event < ApplicationRecord
  self.ignored_columns = %w[license_id]

  include Ahoy::QueryMethods

  self.table_name = "ahoy_events"

  belongs_to :visit, class_name: "Yawl::Visit"
  belongs_to :establishment_account, optional: true
  belongs_to :article, optional: true
end
