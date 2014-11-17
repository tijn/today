require 'time'

class Today
  Event = Struct.new(:title, :from, :to) do

    def self.parse_element(entry)
      if gd_when = entry.at('when')
        from = maybe_time gd_when.attr('starttime')
        to = maybe_time gd_when.attr('endtime')
      end
      new(entry.css('title').text, from, to)
    end

    def to_s
      title
    end

    # Does the event encompass a whole day? (for a given day, defaulting to the current date)
    # This is not the same as testing if it takes up exactly one whole day, or if it takes up exactly 24 hours.
    def all_day?(today = Date.today)
      return true if from.nil? || to.nil?
      from <= today.to_time &&
        to >= today.next.to_time
    end
  
    private

    def self.maybe_time(string)
      return nil if string.nil?
      Time.parse(string)
    end

  end
end
