defmodule Sensors.Humidity do
  @input_pin Application.get_env(:sensors, :humidity_pin)

  require Logger
  alias ElixirALE.GPIO

  def start() do
    Logger.debug "Started humidity on #{@input_pin}"
    { :ok, input_pid } = GPIO.start_link(@input_pin, :input)
    spawn fn -> listen_forever(input_pid) end
    { :ok, self() }
  end

  defp listen_forever(input_pid) do
    GPIO.set_int(input_pid, :both)
    listen_loop()
  end

  defp listen_loop() do
    receive do
      {:gpio_interrupt, @input_pin, :rising} ->
        Logger.debug "Humidity: it's dry on pin #{@input_pin}"
        send(0.0)
      {:gpio_interrupt, @input_pin, :falling} ->
        Logger.debug "Humidity: it's wet on pin #{@input_pin}"
        send(1.0)
    end
    Process.sleep(500)
    listen_loop()
  end

  defp send(value) do
    res = Sensors.Sender.send(
      %Sensors.SenderData{
        data: %{
          humidity: %{
            measured_at: DateTime.utc_now(),
            value: value,
            sensor_name: "humidity_1"
          }
        },
        endpoint: "humidities"
      }
    )
  end
end
