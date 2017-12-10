defmodule SensorsHubWeb.PageController do
  use SensorsHubWeb, :controller

  alias SensorsHub.Aggregators.HydrationAggregator

  def index(conn, _params) do
    hydrations =
      SensorsHub.Sensors.list_hydrations()
      |> HydrationAggregator.aggregate

    thermals = SensorsHub.Sensors.list_thermals()
    proximities = SensorsHub.Sensors.list_proximities()
    humidities = SensorsHub.Sensors.list_humidities()

    humidities_map = Enum.group_by(humidities, &(&1.measured_at.hour), &(&1.value))
    humidity_keys = Poison.encode!(Map.keys(humidities_map))
    humidity_values = Poison.encode!(Enum.map(Map.values(humidities_map), &(Enum.sum(&1))))

    render(conn, "index.html",
      humidity_keys: humidity_keys,
      humidity_values: humidity_values,
      hydrations: hydrations,
      thermals: thermals,
      proximities: proximities,
      humidities: humidities)
  end
end
