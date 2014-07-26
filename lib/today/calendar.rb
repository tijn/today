require 'nokogiri'
require 'open-uri'

module Today

  class Calendar
    attr_reader :doc

    def initialize(xml)
      @doc = Nokogiri.parse(xml)
    end

    def name
      @doc.css('feed > title').text
    end

    def events
      @doc.search('entry').map do |entry|
        entry.css('title').text
      end
    end
  end

end
