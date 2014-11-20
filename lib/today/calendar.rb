require 'icalendar'
require 'open-uri'
require 'today/event'

class Today

  class Calendar
    extend Memoist
    attr_reader :doc

    def initialize(ics, date = Date.today)
      @doc = Icalendar.parse(ics).first
      @date = date
    end

    memoize def name
      "name"
      # @doc.css('feed > title').text
    end

    memoize def events
      @doc.events.map do |entry|
        Event.summarize_ical_event(entry)
      end.select do |event|
        event.occurring_today?(@date)
      end.sort
    end

    def empty?
      events.empty?
    end
  end

end
