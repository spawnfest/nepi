defmodule SensorsHub.Repo.Migrations.CreateHydrations do
  use Ecto.Migration

  def change do
    create table(:hydrations) do
      add :sensor_name, :string
      add :value, :float
      add :measured_at, :utc_datetime

      timestamps()
    end

  end
end
