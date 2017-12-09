defmodule SensorsHub.Repo.Migrations.CreateProximities do
  use Ecto.Migration

  def change do
    create table(:proximities) do
      add :measured_at, :utc_datetime
      add :sensor_name, :string
      add :value, :float

      timestamps()
    end

  end
end
