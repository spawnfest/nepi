defmodule SensorsHubWeb.HydrationController do
  use SensorsHubWeb, :controller

  alias SensorsHub.Sensors
  alias SensorsHub.Sensors.Hydration

  action_fallback SensorsHubWeb.FallbackController

  def index(conn, _params) do
    hydrations = Sensors.list_hydrations()
    render(conn, "index.json", hydrations: hydrations)
  end

  def create(conn, %{"hydration" => hydration_params}) do
    with {:ok, %Hydration{} = hydration} <- Sensors.create_hydration(hydration_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", hydration_path(conn, :show, hydration))
      |> render("show.json", hydration: hydration)
    end
  end

  def show(conn, %{"id" => id}) do
    hydration = Sensors.get_hydration!(id)
    render(conn, "show.json", hydration: hydration)
  end

  def update(conn, %{"id" => id, "hydration" => hydration_params}) do
    hydration = Sensors.get_hydration!(id)

    with {:ok, %Hydration{} = hydration} <- Sensors.update_hydration(hydration, hydration_params) do
      render(conn, "show.json", hydration: hydration)
    end
  end

  def delete(conn, %{"id" => id}) do
    hydration = Sensors.get_hydration!(id)
    with {:ok, %Hydration{}} <- Sensors.delete_hydration(hydration) do
      send_resp(conn, :no_content, "")
    end
  end
end
