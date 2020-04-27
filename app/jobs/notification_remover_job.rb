class NotificationRemoverJob < ApplicationJob
  queue_as :default

  def perform(garden_plant_events, user)
    Garden.remove_notifications(garden_plant_events, user)
  end
end
