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
  }
  WEATHER_CODES = {
    1 => 'sunny',
    2 => 'cloudy',
    3 => 'rainy',
    4 => 'snowy',
    5 => 'sleety',
  }

  def weather_images(weather)
    return [nil, nil] unless WEATHERS.key?(weather)

    key = WEATHERS[weather][0]
    images = ["/images/#{WEATHER_CODES[key/100]}.jpg"]
    if (connect = key % 100 / 10) > 0
      images << connect
    end
    if (key2 = key % 10) > 0
      images << "/images/#{WEATHER_CODES[key2]}.jpg"
    end
    images
  end

  def weather_name(weather)
    WEATHERS.key?(weather) ? WEATHERS[weather][1] : "(#{weather})"
  end

  def wind_value(report)
    "#{DIRECTIONS_J[report.wind_direction.to_i]}/#{report.wind}"
  end
end
