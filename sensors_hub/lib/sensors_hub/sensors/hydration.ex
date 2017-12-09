defmodule SensorsHub.Sensors.Hydration do
  use Ecto.Schema
  import Ecto.Changeset
  alias SensorsHub.Sensors.Hydration


  schema "hydrations" do
    field :measured_at, :utc_datetime
    field :sensor_name, :string
    field :value, :float

    timestamps()
  end

  @doc false
  def changeset(%Hydration{} = hydration, attrs) do
    hydration
    |> cast(attrs, [:sensor_name, :value, :measured_at])
    |> validate_required([:sensor_name, :value, :measured_at])
  end
end
