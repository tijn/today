require 'nokogiri'
require 'open-uri'

module Today

  class Calendar
    def initialize(url)
      @page = fetch_xml(url)
    end

    def name
      @page.css('feed > title').text
    end

    def events
      events = []
      @page.search('entry').each do |entry|
        events << entry.css('title').text
      end
      events
    end

    private

    def url_with_query(base_url)
      base_url + "?" + url_args.join('&')
    end

    def fetch_raw(base_url)
      open url_with_query(base_url)
    end

    def fetch_xml(base_url)
      Nokogiri.parse fetch_raw(base_url)
    end

    def url_args(today = Date.today)
      tomorrow = today + 1
      start_min = "start-min=#{today}"
      start_max = "start-max=#{tomorrow}"
      [start_min, start_max]
    end
  end

end
