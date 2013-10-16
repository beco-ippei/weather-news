# coding: utf-8
module WeatherDecorator
  def time(num)
    hour_start_at + num.hours
  end

  def today?
    time.day == Date.today.day
  end
end
