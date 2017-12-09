defmodule SensorsHubWeb.HumidityController do
  use SensorsHubWeb, :controller

  alias SensorsHub.Sensors
  alias SensorsHub.Sensors.Humidity

  action_fallback SensorsHubWeb.FallbackController

  def index(conn, _params) do
    humidities = Sensors.list_humidities()
    render(conn, "index.json", humidities: humidities)
  end

  def create(conn, %{"humidity" => humidity_params}) do
    SensorsHubWeb.Endpoint.broadcast("sensors:lobby", "humidity", %{ humidity: humidity_params})

    with {:ok, %Humidity{} = humidity} <- Sensors.create_humidity(humidity_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", humidity_path(conn, :show, humidity))
      |> render("show.json", humidity: humidity)
    end
  end

  def show(conn, %{"id" => id}) do
    humidity = Sensors.get_humidity!(id)
    render(conn, "show.json", humidity: humidity)
  end

  def update(conn, %{"id" => id, "humidity" => humidity_params}) do
    humidity = Sensors.get_humidity!(id)

    with {:ok, %Humidity{} = humidity} <- Sensors.update_humidity(humidity, humidity_params) do
      render(conn, "show.json", humidity: humidity)
    end
  end

  def delete(conn, %{"id" => id}) do
    humidity = Sensors.get_humidity!(id)
    with {:ok, %Humidity{}} <- Sensors.delete_humidity(humidity) do
      send_resp(conn, :no_content, "")
    end
  end
end
