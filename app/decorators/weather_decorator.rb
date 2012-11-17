# coding: utf-8
module WeatherDecorator
  def day(num)
    _time(num).strftime '%m/%d'
  end

  def hour(num)
    _time(num).strftime '%H'
  end

  private

  def _time(num)
    hour_start_at + num.hours
  end
end
