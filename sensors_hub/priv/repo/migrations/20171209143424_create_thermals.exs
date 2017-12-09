defmodule SensorsHub.Repo.Migrations.CreateThermals do
  use Ecto.Migration

  def change do
    create table(:thermals) do
      add :measured_at, :utc_datetime
      add :sensor_name, :string
      add :value, :float

      timestamps()
    end

  end
end
