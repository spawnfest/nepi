defmodule Sensors.Sender do

  use GenServer
  require Logger

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def handle_call({:push, item}, _from, _state) do
    result = HTTPoison.get! "http://httparrot.herokuapp.com/get"
    { :reply, result, [] }
  end

  def send(item), do:
    GenServer.call(__MODULE__, {:push, item})

end
