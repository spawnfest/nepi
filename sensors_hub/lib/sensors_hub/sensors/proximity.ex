defmodule SensorsHub.Sensors.Proximity do
  use Ecto.Schema
  import Ecto.Changeset
  alias SensorsHub.Sensors.Proximity


  schema "proximities" do
    field :measured_at, :utc_datetime
    field :sensor_name, :string
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(%Proximity{} = proximity, attrs) do
    proximity
    |> cast(attrs, [:measured_at, :sensor_name, :value])
    |> validate_required([:measured_at, :sensor_name, :value])
  end
end
