defmodule SensorsHub.Aggregators.HydrationAggregator do
  defstruct [keys: [], values: []]

  def aggregate(hydrations) do
    grouped_hydrations = Enum.group_by(hydrations, &(&1.measured_at.hour), &(&1.value))

    keys = grouped_hydrations
      |> Map.keys
      |> Poison.encode!

    values = Enum.map(Map.values(grouped_hydrations), &(Enum.sum(&1)))
      |> Poison.encode!()

    %SensorsHub.Aggregators.HydrationAggregator{
      keys: keys,
      values: values
    }
  end
end
