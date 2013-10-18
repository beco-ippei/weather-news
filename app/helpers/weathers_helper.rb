# coding: utf-8
module WeathersHelper
  DIRECTIONS_J = {
    2  => '北東',
    4  => '東',
    6  => '南東',
    8  => '南',
    10 => '南西',
    12 => '西',
    14 => '北西',
    16 => '北',
  }
  DIRECTIONS = {
    2  => 'NE',
    4  => 'E',
    6  => 'SE',
    8  => 'S',
    10 => 'SW',
    12 => 'W',
    14 => 'NW',
    16 => 'N',
  }
  # [code, name]
  # code[0,2]=1:晴,2:曇,3:雨,4:雪 / code[1]=0:なし,1:時々,2:のち
  WEATHERS = {
    100  => [100, '晴'],
    101  => [112, '晴時々曇'],
    110  => [122, '晴のち曇'],
    111  => [122, '晴のち曇'],
    112  => [123, '晴のち雨'],
    114  => [123, '晴のち雨'],
    200  => [200, '曇'],
    201  => [211, '曇時々晴'],
    202  => [213, '曇時々雨'], #TODO: これも同じ？
    203  => [213, '曇時々雨'], #TODO: これも同じ？
    206  => [213, '曇時々雨'],
    210  => [221, '曇のち晴'],
    211  => [221, '曇のち晴'],
    212  => [223, '曇のち雨'],
    260  => [214, '曇時々雪'],
    270  => [214, '曇時々雪'], #TODO: これも曇り／雪？
    300  => [300, '雨'],
    311  => [321, '雨のち晴'],
    313  => [322, '雨のち曇'],
    400  => [400, '雪'],
    430  => [500, 'みぞれ'],
    550  => [100, '暑晴'],
  }
  WEATHER_CODES = {
    1 => 'sunny',
    2 => 'cloudy',
    3 => 'rainy',
    4 => 'snowy',
    5 => 'sleety',
  }
  ICON_CODES = {
    1 => 'icon-sun sunny',
    2 => 'icon-cloud couldy',
    3 => 'icon-umbrella rainy',
#    4 => 'snowy',
#    5 => 'sleety',
  }

  def weather_icons(weather)
    unless WEATHERS.key?(weather)
      [nil]
    else
      key = WEATHERS[weather][0]
      icons = [ICON_CODES[key/100]]
      if (connect = key % 100 / 10) > 0
        icons.push connect
      end
      if (key2 = key % 10) > 0
        icons.push ICON_CODES[key2]
      end
      icons
    end
  end

  def weather_name(weather)
    WEATHERS.key?(weather) ? WEATHERS[weather][1] : "(#{weather})"
  end

  def wind_values(report)
    [DIRECTIONS[report.wind_direction.to_i].downcase, report.wind]
  end

#  def wind_value(report)
#    "#{DIRECTIONS_J[report.wind_direction.to_i]}/#{report.wind}"
#  end

  def wday(time)
    %w[日 月 火 水 木 金 土][time.wday]
  end

  def month(time)
    time.strftime '%b'
  end

  def hour(time)
    time.strftime '%H'
  end

  def day(time)
    time.strftime '%d'
  end

  def hidden?(time)
    !(time.day == Date.today.day && time <= (DateTime.now + 6.hours)) &&
      time.hour % 3 != 0
  end
end
