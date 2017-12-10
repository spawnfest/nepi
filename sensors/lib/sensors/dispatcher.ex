defmodule Sensors.Dispatcher do

  @sensor_type Application.get_env(:sensors, :sensor_type)

  require Logger

  def start_link() do
    Sensors.Humidity.start()
    Sensors.Hydration.start()
    Sensors.Alarm.start_link()
  end
end
