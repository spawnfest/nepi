defmodule SensorsHubWeb.PageController do
  use SensorsHubWeb, :controller

  alias SensorsHub.Aggregators.{HydrationAggregator, HumidityAggregator}

  def index(conn, _params) do
    hydrations =
      SensorsHub.Sensors.list_hydrations()
      |> HydrationAggregator.aggregate

    humidities =
      SensorsHub.Sensors.list_humidities()
      |> HumidityAggregator.aggregate

    thermals = SensorsHub.Sensors.list_thermals()
    proximities = SensorsHub.Sensors.list_proximities()

    render(conn, "index.html",
      humidity_keys: humidities.keys,
      humidity_values: humidities.values,
      hydrations: hydrations,
      thermals: thermals,
      proximities: proximities,
      humidities: humidities)
  end
end
