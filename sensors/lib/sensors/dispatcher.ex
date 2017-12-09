defmodule Sensors.Dispatcher do

  @sensor_type Application.get_env(:sensors, :sensor_type)

  require Logger

  def start_link() do
    start_sensor(@sensor_type)
  end

  def start_sensor(:hydration) do
    Sensors.Hydration.start()
  end
end
