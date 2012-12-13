# coding: utf-8
module WeatherDecorator
  def day_by_hour(num)
    _time(num).strftime '%m/%d'
  end

  def hour(num)
    _time(num).strftime '%H'
  end

  def day(num)
    (hour_start_at + (num+1).days).strftime '%m/%d'
  end

  private

  def _time(num)
    hour_start_at + num.hours
  end
end
