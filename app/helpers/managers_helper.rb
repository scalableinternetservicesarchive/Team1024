module ManagersHelper
  def cache_key_for_all_event(event)
    "all_event-#{event.name}-#{event.start_time.to_s}-#{event.description}"
  end

  def cache_key_for_current_event(event)
    "current_event-#{event.name}-#{event.start_time.to_s}-#{event.description}"
  end

  def cache_key_for_past_event(event)
    "past_event-#{event.name}-#{event.start_time.to_s}-#{event.description}"
  end
end
