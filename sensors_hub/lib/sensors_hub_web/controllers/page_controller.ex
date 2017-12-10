defmodule SensorsHubWeb.PageController do
  use SensorsHubWeb, :controller

  def index(conn, _params) do
    hydrations = SensorsHub.Sensors.list_hydrations()
    h2 = Enum.group_by(hydrations, &(&1.measured_at.hour), &(&1.value))
    h_kyes = Poison.encode!(Map.keys(h2))

    h_values = Poison.encode!(Enum.map(Map.values(h2), &(Enum.sum(&1))))

    IO.inspect(h_kyes)
    thermals = SensorsHub.Sensors.list_thermals()
    proximities = SensorsHub.Sensors.list_proximities()
    humidities = SensorsHub.Sensors.list_humidities()

    humidities_map = Enum.group_by(humidities, &(&1.measured_at.hour), &(&1.value))
    humidity_keys = Poison.encode!(Map.keys(humidities_map))
    humidity_values = Poison.encode!(Enum.map(Map.values(humidities_map), &(Enum.sum(&1))))

    render(conn, "index.html", humidity_keys: humidity_keys, humidity_values: humidity_values, hydro_keys: h_kyes,hydro_values: h_values, thermals: thermals, proximities: proximities, humidities: humidities)
  end
end
