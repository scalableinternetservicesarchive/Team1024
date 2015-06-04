module UsersHelper
  def cache_key_for_favorite_event(event)
    "favorite_event-#{event.id.to_s}-#{event.name}-#{event.start_time.to_s}-#{event.description}"
  end

  def cache_key_for_attending_event(event)
    "attending_event-#{event.name}-#{event.start_time.to_s}-#{event.description}"
  end

  def cache_key_for_search_event(event)
    "search_event-#{event.name}-#{event.start_time.to_s}-#{event.description}"
  end
end
