defmodule SensorsHubWeb.PageController do
  use SensorsHubWeb, :controller

  def index(conn, _params) do
    hydrations = SensorsHub.Sensors.list_hydrations()
    thermals = SensorsHub.Sensors.list_thermals()
    proximities = SensorsHub.Sensors.list_proximities()
    humidities = SensorsHub.Sensors.list_humidities()

    render(conn, "index.html", hydrations: hydrations, thermals: thermals, proximities: proximities, humidities: humidities)
  end
end
