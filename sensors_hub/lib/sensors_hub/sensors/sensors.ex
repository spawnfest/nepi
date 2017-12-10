defmodule SensorsHub.Sensors do
  @moduledoc """
  The Sensors context.
  """

  import Ecto.Query, warn: false
  alias SensorsHub.Repo

  alias SensorsHub.Sensors.Hydration

  @doc """
  Returns the list of hydrations.

  ## Examples

      iex> list_hydrations()
      [%Hydration{}, ...]

  """
  def list_hydrations do
    Repo.all(Hydration)
  end

  def list_today_hydrations do
     all = Repo.all(Hydration)
     Enum.filter(all, &(Date.compare(DateTime.to_date(&1.measured_at), Date.utc_today) == :eq))
  end

  @doc """
  Gets a single hydration.

  Raises `Ecto.NoResultsError` if the Hydration does not exist.

  ## Examples

      iex> get_hydration!(123)
      %Hydration{}

      iex> get_hydration!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hydration!(id), do: Repo.get!(Hydration, id)

  @doc """
  Creates a hydration.

  ## Examples

      iex> create_hydration(%{field: value})
      {:ok, %Hydration{}}

      iex> create_hydration(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hydration(attrs \\ %{}) do
    %Hydration{}
    |> Hydration.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hydration.

  ## Examples

      iex> update_hydration(hydration, %{field: new_value})
      {:ok, %Hydration{}}

      iex> update_hydration(hydration, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hydration(%Hydration{} = hydration, attrs) do
    hydration
    |> Hydration.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Hydration.

  ## Examples

      iex> delete_hydration(hydration)
      {:ok, %Hydration{}}

      iex> delete_hydration(hydration)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hydration(%Hydration{} = hydration) do
    Repo.delete(hydration)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hydration changes.

  ## Examples

      iex> change_hydration(hydration)
      %Ecto.Changeset{source: %Hydration{}}

  """
  def change_hydration(%Hydration{} = hydration) do
    Hydration.changeset(hydration, %{})
  end

  alias SensorsHub.Sensors.Thermal

  @doc """
  Returns the list of thermals.

  ## Examples

      iex> list_thermals()
      [%Thermal{}, ...]

  """
  def list_thermals do
    Repo.all(Thermal)
  end

  @doc """
  Gets a single thermal.

  Raises `Ecto.NoResultsError` if the Thermal does not exist.

  ## Examples

      iex> get_thermal!(123)
      %Thermal{}

      iex> get_thermal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_thermal!(id), do: Repo.get!(Thermal, id)

  @doc """
  Creates a thermal.

  ## Examples

      iex> create_thermal(%{field: value})
      {:ok, %Thermal{}}

      iex> create_thermal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_thermal(attrs \\ %{}) do
    %Thermal{}
    |> Thermal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a thermal.

  ## Examples

      iex> update_thermal(thermal, %{field: new_value})
      {:ok, %Thermal{}}

      iex> update_thermal(thermal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_thermal(%Thermal{} = thermal, attrs) do
    thermal
    |> Thermal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Thermal.

  ## Examples

      iex> delete_thermal(thermal)
      {:ok, %Thermal{}}

      iex> delete_thermal(thermal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_thermal(%Thermal{} = thermal) do
    Repo.delete(thermal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking thermal changes.

  ## Examples

      iex> change_thermal(thermal)
      %Ecto.Changeset{source: %Thermal{}}

  """
  def change_thermal(%Thermal{} = thermal) do
    Thermal.changeset(thermal, %{})
  end

  alias SensorsHub.Sensors.Humidity

  @doc """
  Returns the list of humidities.

  ## Examples

      iex> list_humidities()
      [%Humidity{}, ...]

  """
  def list_humidities do
    Repo.all(Humidity)
  end

  def list_today_humidities do
      all = Repo.all(Humidity)
      Enum.filter(all, &(Date.compare(DateTime.to_date(&1.measured_at), Date.utc_today) == :eq))
  end

  @doc """
  Gets a single humidity.

  Raises `Ecto.NoResultsError` if the Humidity does not exist.

  ## Examples

      iex> get_humidity!(123)
      %Humidity{}

      iex> get_humidity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_humidity!(id), do: Repo.get!(Humidity, id)

  @doc """
  Creates a humidity.

  ## Examples

      iex> create_humidity(%{field: value})
      {:ok, %Humidity{}}

      iex> create_humidity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_humidity(attrs \\ %{}) do
    %Humidity{}
    |> Humidity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a humidity.

  ## Examples

      iex> update_humidity(humidity, %{field: new_value})
      {:ok, %Humidity{}}

      iex> update_humidity(humidity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_humidity(%Humidity{} = humidity, attrs) do
    humidity
    |> Humidity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Humidity.

  ## Examples

      iex> delete_humidity(humidity)
      {:ok, %Humidity{}}

      iex> delete_humidity(humidity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_humidity(%Humidity{} = humidity) do
    Repo.delete(humidity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking humidity changes.

  ## Examples

      iex> change_humidity(humidity)
      %Ecto.Changeset{source: %Humidity{}}

  """
  def change_humidity(%Humidity{} = humidity) do
    Humidity.changeset(humidity, %{})
  end

  alias SensorsHub.Sensors.Proximity

  @doc """
  Returns the list of proximities.

  ## Examples

      iex> list_proximities()
      [%Proximity{}, ...]

  """
  def list_proximities do
    Repo.all(Proximity)
  end

  @doc """
  Gets a single proximity.

  Raises `Ecto.NoResultsError` if the Proximity does not exist.

  ## Examples

      iex> get_proximity!(123)
      %Proximity{}

      iex> get_proximity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_proximity!(id), do: Repo.get!(Proximity, id)

  @doc """
  Creates a proximity.

  ## Examples

      iex> create_proximity(%{field: value})
      {:ok, %Proximity{}}

      iex> create_proximity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_proximity(attrs \\ %{}) do
    %Proximity{}
    |> Proximity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a proximity.

  ## Examples

      iex> update_proximity(proximity, %{field: new_value})
      {:ok, %Proximity{}}

      iex> update_proximity(proximity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_proximity(%Proximity{} = proximity, attrs) do
    proximity
    |> Proximity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Proximity.

  ## Examples

      iex> delete_proximity(proximity)
      {:ok, %Proximity{}}

      iex> delete_proximity(proximity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_proximity(%Proximity{} = proximity) do
    Repo.delete(proximity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking proximity changes.

  ## Examples

      iex> change_proximity(proximity)
      %Ecto.Changeset{source: %Proximity{}}

  """
  def change_proximity(%Proximity{} = proximity) do
    Proximity.changeset(proximity, %{})
  end
end
