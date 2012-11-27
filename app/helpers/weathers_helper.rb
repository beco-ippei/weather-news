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
    tag = "<span class='weather_#{weather.to_i.round(-2)}'>#{weather}</span>"
    if (next_weather = weather.to_i % 10) > 0
      tag += "時々<span class='weather_#{next_weather*100}'>#{weather}</span>"
    elsif (sometime_weather = weather.to_i / 10 % 10) > 0
      tag += "のち<span class='weather_#{sometime_weather*100}'>#{weather}</span>"
    end

    raw tag + "<br><span class='font-m'>#{weather}(#{WEATHER[weather.to_i]})</span>"
  end
  WEATHER = {
    100  => '晴',
    110  => '晴 / 曇',
    200  => '曇',
    201  => '曇時々晴',
    202  => '曇時々雨',
    300  => '雨',
  }

  def wind_value(report)
    "#{DIRECTION_J[report.wind_direction.to_i]}/#{report.wind}"
  end
end
