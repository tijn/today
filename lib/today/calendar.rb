require 'nokogiri'
require 'open-uri'

module Today

  # wrapper around the xml google calendar returns
  class Calendar
    attr_reader :doc

    def initialize(xml)
      @doc = Nokogiri.parse(xml)
    end

    def name
      @doc.css('feed > title').text
    end

    def events
      events = []
      @doc.search('entry').each do |entry|
        events << entry.css('title').text
      end
      events
    end
  end

end
