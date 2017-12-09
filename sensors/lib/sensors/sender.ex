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
      request_content = get_request_content(data)

      format_url(endpoint)
      |> HTTPoison.post!(request_content)
    rescue
      e -> e
    end

    { :reply, result, [] }
  end

  def send(item), do:
    GenServer.call(__MODULE__, {:push, item})

  defp format_url(endpoint), do:
    "#{@base_url}#{endpoint}"

  defp get_request_content(data), do:
    Poison.encode!(data)

end
