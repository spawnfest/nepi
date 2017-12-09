defmodule SensorsHub.Sensors.Thermal do
  use Ecto.Schema
  import Ecto.Changeset
  alias SensorsHub.Sensors.Thermal


  schema "thermals" do
    field :measured_at, :utc_datetime
    field :sensor_name, :string
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(%Thermal{} = thermal, attrs) do
    thermal
    |> cast(attrs, [:measured_at, :sensor_name, :value])
    |> validate_required([:measured_at, :sensor_name, :value])
  end
end
