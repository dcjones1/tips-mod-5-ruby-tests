require 'pry'
require 'active_support'
require 'active_support/core_ext'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    current = @start

    while current <= date
      if current == date
        return true
      end

      if @period == 'monthly'
        current = current.advance(months: @interval)
        if date == date.end_of_month.beginning_of_day
          current = current.end_of_month.beginning_of_day
        end
      elsif @period == 'weekly'
        current = current.advance(weeks: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end

    end
    return false
  end
end
