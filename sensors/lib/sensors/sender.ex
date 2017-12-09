defmodule Sensors.SenderData do
  defstruct data: nil, endpoint: ""
end

defmodule Sensors.Sender do
  use GenServer
  require Logger

  @base_url Application.get_env(:sensors, :base_url)

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def handle_call({:push, %Sensors.SenderData{data: data, endpoint: endpoint}}, _from, _state) do
    result = try do
      url = format_url(endpoint)
      Logger.error "Sending #{inspect data} to endpoint #{url}"
      HTTPoison.post!(url, data)
    rescue
      e -> e
    end

    { :reply, result, [] }
  end

  def send(item), do:
    GenServer.call(__MODULE__, {:push, item})

  defp format_url(endpoint), do:
    "#{@base_url}#{endpoint}"

end
