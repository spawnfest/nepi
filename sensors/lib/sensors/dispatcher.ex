defmodule Sensors.Dispatcher do

  @sensor_type Application.get_env(:sensors, :sensor_type)

  require Logger

  def start_link() do
    start_sensor(:hydration)
    start_sensor(:humidity)
  end

  defp start_sensor(:humidity), do: Sensors.Humidity.start()
  defp start_sensor(:hydration), do: Sensors.Hydration.start()

end
