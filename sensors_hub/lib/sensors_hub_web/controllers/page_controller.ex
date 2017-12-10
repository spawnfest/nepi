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

    render(conn, "index.html", hydrations: h2, hydro_keys: h_kyes,hydro_values: h_values, thermals: thermals, proximities: proximities, humidities: humidities)
  end
end
