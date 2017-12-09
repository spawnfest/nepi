defmodule SensorsHubWeb.HydrationView do
  use SensorsHubWeb, :view
  alias SensorsHubWeb.HydrationView

  def render("index.json", %{hydrations: hydrations}) do
    %{data: render_many(hydrations, HydrationView, "hydration.json")}
  end

  def render("show.json", %{hydration: hydration}) do
    %{data: render_one(hydration, HydrationView, "hydration.json")}
  end

  def render("hydration.json", %{hydration: hydration}) do
    %{id: hydration.id,
      sensor_name: hydration.sensor_name,
      value: hydration.value,
      measured_at: hydration.measured_at}
  end
end
