defmodule SensorsHubWeb.ThermalController do
  use SensorsHubWeb, :controller

  alias SensorsHub.Sensors
  alias SensorsHub.Sensors.Thermal

  action_fallback SensorsHubWeb.FallbackController

  def index(conn, _params) do
    thermals = Sensors.list_thermals()
    render(conn, "index.json", thermals: thermals)
  end

  def create(conn, %{"thermal" => thermal_params}) do
    with {:ok, %Thermal{} = thermal} <- Sensors.create_thermal(thermal_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", thermal_path(conn, :show, thermal))
      |> render("show.json", thermal: thermal)
    end
  end

  def show(conn, %{"id" => id}) do
    thermal = Sensors.get_thermal!(id)
    render(conn, "show.json", thermal: thermal)
  end

  def update(conn, %{"id" => id, "thermal" => thermal_params}) do
    thermal = Sensors.get_thermal!(id)

    with {:ok, %Thermal{} = thermal} <- Sensors.update_thermal(thermal, thermal_params) do
      render(conn, "show.json", thermal: thermal)
    end
  end

  def delete(conn, %{"id" => id}) do
    thermal = Sensors.get_thermal!(id)
    with {:ok, %Thermal{}} <- Sensors.delete_thermal(thermal) do
      send_resp(conn, :no_content, "")
    end
  end
end
