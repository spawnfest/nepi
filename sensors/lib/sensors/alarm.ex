defmodule Sensors.Alarm do

  require Logger
  alias Phoenix.Channels.GenSocketClient
  @socket_url Application.get_env(:sensors, :socket_url)
  @alarm_pin Application.get_env(:sensors, :alarm_pin)

  @behaviour GenSocketClient
  alias ElixirALE.GPIO

  def start_link() do
    try do
      GenSocketClient.start_link(
            __MODULE__,
            Phoenix.Channels.GenSocketClient.Transport.WebSocketClient,
            @socket_url
          )
    rescue
      e ->
        start_link()
    end
  end

  def init(url) do
    {:ok, alarm_pid} = GPIO.start_link(@alarm_pin, :output)
    {:connect, url, [], %{ alarm_pid: alarm_pid, current_state: 0 }}
  end

  def handle_connected(transport, state) do
    Logger.info("connected")
    GenSocketClient.join(transport, "sensors:lobby")
    {:ok, state}
  end

  def handle_disconnected(reason, state) do
    Logger.error("disconnected: #{inspect reason}")
    Process.send_after(self(), :connect, :timer.seconds(1))
    {:ok, state}
  end

  def handle_joined(topic, _payload, _transport, state) do
    Logger.info("joined the topic #{topic}")

    {:ok, state}
  end

  def handle_join_error(topic, payload, _transport, state) do
    Logger.error("join error on the topic #{topic}: #{inspect payload}")
    {:ok, state}
  end

  def handle_channel_closed(topic, payload, _transport, state) do
    Logger.error("disconnected from the topic #{topic}: #{inspect payload}")
    Process.send_after(self(), {:join, topic}, :timer.seconds(1))
    {:ok, state}
  end

  def handle_message(topic, "buzzer", payload, _transport, state) do
    Logger.info("server onbuzzer")
    handle_alarm(state)
  end

  def handle_message(_, _, _, _, state), do: {:ok, state}

  defp handle_alarm(%{alarm_pid: pid, current_state: 0} = state) do
    GPIO.write(pid, 1)
    {:ok, %{state | current_state: 1}}
  end

  defp handle_alarm(%{alarm_pid: pid, current_state: 1} = state) do
    GPIO.write(pid, 0)
    {:ok, %{state | current_state: 0}}
  end


  def handle_reply(topic, _ref, payload, _transport, state) do
    Logger.warn("reply on topic #{topic}: #{inspect payload}")
    {:ok, state}
  end

  def handle_info(:connect, _transport, state) do
    Logger.info("connecting")
    {:connect, state}
  end

  def handle_info({:join, topic}, transport, state) do
    Logger.info("joining the topic #{topic}")
    case GenSocketClient.join(transport, topic) do
      {:error, reason} ->
        Logger.error("error joining the topic #{topic}: #{inspect reason}")
        Process.send_after(self(), {:join, topic}, :timer.seconds(1))
      {:ok, _ref} -> :ok
    end

    {:ok, state}
  end
  def handle_info(message, _transport, state) do
    Logger.warn("Unhandled message #{inspect message}")
    {:ok, state}
  end
end
