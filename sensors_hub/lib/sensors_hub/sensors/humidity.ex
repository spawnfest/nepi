defmodule SensorsHub.Sensors.Humidity do
  use Ecto.Schema
  import Ecto.Changeset
  alias SensorsHub.Sensors.Humidity


  schema "humidities" do
    field :measured_at, :utc_datetime
    field :sensor_name, :string
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(%Humidity{} = humidity, attrs) do
    humidity
    |> cast(attrs, [:measured_at, :sensor_name, :value])
    |> validate_required([:measured_at, :sensor_name, :value])
  end
end
