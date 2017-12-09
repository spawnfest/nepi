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
end
