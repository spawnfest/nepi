defmodule SensorsHub.Aggregators.HydrationAggregator do
  defstruct [keys: [], values: []]

  def aggregate(hydrations) do
    h2 = Enum.group_by(hydrations, &(&1.measured_at.hour), &(&1.value))
    keys = Poison.encode!(Map.keys(h2))
    values = Poison.encode!(Enum.map(Map.values(h2), &(Enum.sum(&1))))

    %SensorsHub.Aggregators.HydrationAggregator{
      keys: keys,
      values: values
    }
  end
end
