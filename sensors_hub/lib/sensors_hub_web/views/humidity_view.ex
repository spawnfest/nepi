defmodule SensorsHubWeb.HumidityView do
  use SensorsHubWeb, :view
  alias SensorsHubWeb.HumidityView

  def render("index.json", %{humidities: humidities}) do
    %{data: render_many(humidities, HumidityView, "humidity.json")}
  end

  def render("show.json", %{humidity: humidity}) do
    %{data: render_one(humidity, HumidityView, "humidity.json")}
  end

  def render("humidity.json", %{humidity: humidity}) do
    %{id: humidity.id,
      measured_at: humidity.measured_at,
      sensor_name: humidity.sensor_name,
      value: humidity.value}
  end
end
