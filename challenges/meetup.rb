require 'date'
class Meetup
  WEEKDAYS = {monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 0 }
  DAYS_END_IN_TEENTH = [13, 14, 15, 16, 17, 18, 19]
  attr_reader :year, :month
  
  def initialize(month, year)
    @year = year
    @month = month
  end
  
  def retrieve_weekdays(weekday)
    date = Date.new(year, month, 1)
    month = date.month
    weekdays = []
    loop do
      day_in_week = date.wday
      weekdays << date.day if day_in_week == weekday
      date = date.next_day
      break if month != date.month
    end
    weekdays
  end
  
  def day(weekday, schedule)
    weekday = WEEKDAYS[weekday]
    weekdays = retrieve_weekdays(weekday)
    
    d = case schedule
    when :teenth
      weekdays.find {|w| DAYS_END_IN_TEENTH.include?(w) }
    when :last
      weekdays.last
    when :first
      weekdays[0]
    when :second
      weekdays[1]
    when :third
      weekdays[2]
    when :fourth
      weekdays[3]
    end
    Date.new(year, month, d)
  end
end

