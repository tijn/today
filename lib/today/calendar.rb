require 'nokogiri'
require 'open-uri'

module Today

  # Why does this class exist?
  # it fetches the xml from google calendar
  # and it has two methods that help with finding the info we want from the resulting XML
  #
  # But why do I do these silly things? Why does this class have two tasks!? I kind of hate it already.
  # Man... what was I thinking?
  # URI is perfect for putting some extra params in the url
  # and open-uri is perfectly able to fetch something
  # this class should just be a thin wrapper around a Nokogiri-document to query for the right info.
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
