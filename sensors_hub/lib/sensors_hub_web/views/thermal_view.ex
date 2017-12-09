defmodule SensorsHubWeb.ThermalView do
  use SensorsHubWeb, :view
  alias SensorsHubWeb.ThermalView

  def render("index.json", %{thermals: thermals}) do
    %{data: render_many(thermals, ThermalView, "thermal.json")}
  end

  def render("show.json", %{thermal: thermal}) do
    %{data: render_one(thermal, ThermalView, "thermal.json")}
  end

  def render("thermal.json", %{thermal: thermal}) do
    %{id: thermal.id,
      measured_at: thermal.measured_at,
      sensor_name: thermal.sensor_name,
      value: thermal.value}
  end
end
