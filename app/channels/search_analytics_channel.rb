class SearchAnalyticsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'search_analytics'
  end

  def unsubscribed
    # Any cleanup needed when the channel is unsubscribed
  end
end
