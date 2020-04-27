class NotificationSenderJob < ApplicationJob
  queue_as :default

  def perform(garden,plant)
    Garden.add_notification(garden, plant)
  end
end
