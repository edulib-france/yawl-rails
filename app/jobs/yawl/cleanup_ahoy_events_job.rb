class Yawl::CleanupAhoyEventsJob < ApplicationJob
  queue_as :default

  DELAY_INTERVAL = 10.day.ago

  def perform
    Ahoy::Event.where(time: ...DELAY_INTERVAL).delete_all
    Ahoy::Visit.where(started_at: ...DELAY_INTERVAL).delete_all
  end
end
