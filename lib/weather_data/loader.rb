class Loader
  FILE_PATH = 'vendor/weather_data/61286.xml'

  attr_accessor :xml_data, :data

  def initialize
    xml_data = Hash::from_xml(File.open(FILE_PATH).read)['weathernews']

    @data = xml_data['data']
  end

  def area
    data['areaNo']
  end

  def hour_start_at
    day = data['day']
    year = day['startYear']
    month = day['startMonth']
    day = day['startDate']
    #day_of_week = day['startDay']
    hour = day['startHour']
    Time.new("#{year}-#{month}-#{day} #{hour}:00:00")
  end

  def hour_reports
    values = data['day']
    keys = %w[weather temperature wind precipitation]
    keys.map {|k| values[k]['hour'] }.transpose.map do |hour_values|
      report = Weather::HourReport.new.tap do |r|
        r.weather = hour_values[0]
        r.temperature = hour_values[1]
        r.wind = hour_values[2]
        r.rain = hour_values[3]
      end
    end
  end
end
