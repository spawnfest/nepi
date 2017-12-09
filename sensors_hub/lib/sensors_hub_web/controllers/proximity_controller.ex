defmodule SensorsHubWeb.ProximityController do
  use SensorsHubWeb, :controller

  alias SensorsHub.Sensors
  alias SensorsHub.Sensors.Proximity

  action_fallback SensorsHubWeb.FallbackController

  def index(conn, _params) do
    proximities = Sensors.list_proximities()
    render(conn, "index.json", proximities: proximities)
  end

  def create(conn, %{"proximity" => proximity_params}) do
    SensorsHubWeb.Endpoint.broadcast("sensors:lobby", "proximity", %{ proximity: proximity_params})
    
    with {:ok, %Proximity{} = proximity} <- Sensors.create_proximity(proximity_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", proximity_path(conn, :show, proximity))
      |> render("show.json", proximity: proximity)
    end
  end

  def show(conn, %{"id" => id}) do
    proximity = Sensors.get_proximity!(id)
    render(conn, "show.json", proximity: proximity)
  end

  def update(conn, %{"id" => id, "proximity" => proximity_params}) do
    proximity = Sensors.get_proximity!(id)

    with {:ok, %Proximity{} = proximity} <- Sensors.update_proximity(proximity, proximity_params) do
      render(conn, "show.json", proximity: proximity)
    end
  end

  def delete(conn, %{"id" => id}) do
    proximity = Sensors.get_proximity!(id)
    with {:ok, %Proximity{}} <- Sensors.delete_proximity(proximity) do
      send_resp(conn, :no_content, "")
    end
  end
end
