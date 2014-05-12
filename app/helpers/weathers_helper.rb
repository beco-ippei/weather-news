# coding: utf-8
module WeathersHelper
  DIRECTIONS = {
    1  => 'nne',
    2  => 'ne',
    3  => 'ene',
    4  => 'e',
    5  => 'ese',
    6  => 'se',
    7  => 'sse',
    8  => 's',
    9  => 'ssw',
    10 => 'sw',
    11 => 'wsw',
    12 => 'w',
    13 => 'wnw',
    14 => 'nw',
    15 => 'nnw',
    16 => 'n',
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
    10 => 'icon-moon moon',
#    4 => 'snowy',
#    5 => 'sleety',
  }

  def weather_icons(weather, time = nil)
    unless WEATHERS.key?(weather)
      [nil]
    else
      key = WEATHERS[weather][0]
      key *= 10 if daytime?(time) && ICON_CODES.keys.include?(key/100*10)
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

  def daytime?(time)
    time && !(6..18).include?(time.hour)
  end

  def weather_name(weather)
    WEATHERS.key?(weather) ? WEATHERS[weather][1] : "(#{weather})"
  end

  def wind_values(report)
    p report if report.wind_direction.to_i == 5
    [DIRECTIONS[report.wind_direction.to_i], report.wind]
  end

  def wday(time)
    %w[日 月 火 水 木 金 土][time.wday]
  end

  def month(time)
#    time.strftime '%b'
    time.strftime '%-m/'
  end

  def hour(time)
    time.strftime '%H'
  end

  def day(time)
    time.strftime '%d'
  end

  def hidden?(time)
#    !(time.day == Date.today.day && time <= (DateTime.now + 6.hours)) &&
#      time.hour % 3 != 0
    (DateTime.now + 6.hours) < time && time.hour % 3 != 0
  end
end
