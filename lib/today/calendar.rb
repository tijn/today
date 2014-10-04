require 'nokogiri'
require 'open-uri'
require 'today/event'

class Today

  class Calendar
    extend Memoist
    attr_reader :doc

    def initialize(xml)
      @doc = Nokogiri.parse(xml)
    end

    memoize def name
      @doc.css('feed > title').text
    end

    memoize def events
      @doc.search('entry').map do |entry|
        Event.parse_element(entry)
      end
    end

    def empty?
      events.empty?
    end
  end

end
