require 'time'

class Today
  Event = Struct.new(:title, :from, :to) do

    def self.summarize_ical_event(entry)
      from = entry.dtstart
      to = entry.dtend
      new(entry.summary, from, to)
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

    def after_today?(today = Date.today)
      from.to_date > today
    end

    def before_today?(today = Date.today)
      if to.nil?
        from.to_date < today
      else
        to.to_date < today
      end
    end

    def occurring_today?(today = Date.today)
      !after_today?(today) && !before_today?(today)
    end

    def <=>(other)
      from.to_time <=> other.from.to_time
    end

    private

    def self.maybe_time(string)
      return nil if string.nil?
      Time.parse(string)
    end

  end
end
