require 'today/abbreviated_time_printer'

class Today

  class EventPrinter
    extend Memoist
    attr_reader :today

    def initialize(today = Date.today)
      @today = today
    end

    memoize def time_printer
      AbbreviatedTimePrinter.new(@today)
    end

    def print(event)
      if event.all_day?(@today)
        event.title
      else
        "(#{time_printer.print(event.from)} - #{time_printer.print(event.to)}) #{event.title}"
      end
    end
  end


end
