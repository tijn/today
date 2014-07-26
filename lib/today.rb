require 'today/calendar'

module Today
  VERSION = "1.0.1"

  def self.fetch_calendar(url)
    Calendar.new(open(calendar_url_for_today(url)))
  end

  def self.calendar_url_for_today(url, today = Date.today)
    uri = URI.parse(url)
    tomorrow = today + 1
    start_min = "start-min=#{today}"
    start_max = "start-max=#{tomorrow}"
    uri.query = [uri.query, start_min, start_max].compact.join('&')
    uri.to_s
  end
end
