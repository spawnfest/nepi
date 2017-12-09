defmodule SensorsHubWeb.ProximityView do
  use SensorsHubWeb, :view
  alias SensorsHubWeb.ProximityView

  def render("index.json", %{proximities: proximities}) do
    %{data: render_many(proximities, ProximityView, "proximity.json")}
  end

  def render("show.json", %{proximity: proximity}) do
    %{data: render_one(proximity, ProximityView, "proximity.json")}
  end

  def render("proximity.json", %{proximity: proximity}) do
    %{id: proximity.id,
      measured_at: proximity.measured_at,
      sensor_name: proximity.sensor_name,
      value: proximity.value}
  end
end
