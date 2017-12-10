defmodule SensorsHub.Aggregators.HumidityAggregator do
  defstruct [keys: [], values: []]

  def aggregate(humidities) do
    humidities_map = Enum.group_by(humidities, &(&1.measured_at.hour), &(&1.value))
    keys = Poison.encode!(Map.keys(humidities_map))
    values = Poison.encode!(Enum.map(Map.values(humidities_map), &(Enum.sum(&1))))

    %SensorsHub.Aggregators.HumidityAggregator{
      keys: keys,
      values: values
    }
  end
end
