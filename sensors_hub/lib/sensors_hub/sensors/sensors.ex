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
end
