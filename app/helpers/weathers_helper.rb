# coding: utf-8
module WeathersHelper
  DIRECTION_J = {
    2  => '北東',
    4  => '東',
    6  => '南東',
    8  => '南',
    10 => '南西',
    12 => '西',
    14 => '北西',
    16 => '北',
  }
  DIRECTION = {
    2  => 'NE',
    4  => 'E',
    6  => 'SE',
    8  => 'S',
    10 => 'SW',
    12 => 'W',
    14 => 'NW',
    16 => 'N',
  }

  def weather_tag(weather)
    raw "<p class='weather_#{weather}'>#{weather}</p>"
  end

  def wind_value(report)
    "#{DIRECTION_J[report.wind_direction.to_i]}/#{report.wind}"
  end
end
