class Today

  class AbbreviatedTimePrinter
    attr_reader :today

    def initialize(today = Date.today)
      @today = today
    end

    def relative_time_format(time)
      format = ''
      if time.to_date == @today
        # do nothing
      elsif time.to_date < @today - 7 || time.to_date > @today - 7
        format << '%A '
      elsif time.year != @today.year
        format << '%F ' # print full date
      elsif time.month != @today.month || time.day != @today.day
        format << '%m-%d ' # print month-day
      end

      format << "%R"
    end

    def print(time)
      time.strftime(relative_time_format(time))
    end
  end

end
