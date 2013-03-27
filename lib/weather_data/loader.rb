class Loader
  FILE_PATH = 'vendor/weather_data/'

  attr_accessor :xml_data, :data, :date_info

  class LoaderException; end

  def initialize(point)
    if !File.exists?(file = FILE_PATH+"#{point}.xml")
      raise LoaderException.new
    end
    xml_data = Hash::from_xml(File.open(file).read)['weathernews']

    @data = xml_data['data']
    @date_info = xml_data['date']
  end

  def area
    data['areaNo']
  end

  def hour_start_at
    day = data['day']

    year = day['startYear']
    month = day['startMonth']
    day_of_month = day['startDate']
    hour = day['startHour']
    Time.new(year, month, day_of_month, hour, 0, 0)
  end

  def hour_reports
    values = data['day']
    keys = %w[weather temperature wind precipitation]
    keys.map {|k| values[k]['hour'] }.transpose.map do |hour_values|
      Weather::HourReport.new.tap do |r|
        r.weather = hour_values[0].to_i
        r.temperature = hour_values[1]
        r.wind = hour_values[2]
        r.rain = hour_values[3]
      end
    end
  end

  def week_reports
    values = data['week']
    dates = date_info['week']
    keys = %w[weather temperature chance_of_rain]
    start_date = nil
    (keys.map {|k| values[k]['day'] }.push(dates['day'])).transpose.map do |week_values|
      Weather::WeekReport.new.tap do |r|
        r.weather = week_values[0].to_i
        r.temperature = week_values[1]
        r.chance_of_rain = week_values[2]
        r.date = Date.parse(Date.today.strftime("%Y-%m-#{day = week_values[3]['date'].to_i}"))
        r.date += 1.month if start_date && start_date.day > day
        start_date ||= r.date
      end
    end
  end
end
