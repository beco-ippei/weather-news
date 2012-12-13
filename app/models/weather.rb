require Rails.root.to_path + '/lib/weather_data/loader'

class Weather
  attr_accessor :hour_start_at, :hour_reports, :week_reports
#    :time, :area, :week_reports,
#    :temperature_unit, :wind_unit, :rain_unit, :probability_of_rain_unit

  def initialize
    loader = Loader.new

    @hour_start_at = loader.hour_start_at
    @hour_reports = loader.hour_reports
    @week_reports = loader.week_reports
  end

  class HourReport
    attr_accessor :weather, :temperature, :wind, :wind_direction, :rain

    def wind=(value)
      @wind = value['value']
      @wind_direction = value['direction']
    end

    def precipitation=(value)
      @rain = value
    end
  end

  class WeekReport
    attr_accessor :weather, :max_temperature, :min_temperature, :chance_of_rain, :date

    def temperature=(value)
      @max_temperature = value['max']
      @min_temperature = value['min']
    end
  end
end
