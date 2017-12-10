defmodule Sensors.Hydration do
  @input_pin Application.get_env(:sensors, :hydration_pin)

  require Logger
  alias ElixirALE.GPIO

  def start() do
    Logger.debug "Started hydration on #{@input_pin}"
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
        Logger.debug "Received dehydration on pin #{@input_pin}"
        send(0.0)
      {:gpio_interrupt, @input_pin, :falling} ->
        Logger.debug "Received hydration on pin #{@input_pin}"
        send(1.0)
      response ->
        Logger.error "Unexcpected receive #{inspect response}"
    end
    Process.sleep(500)
    listen_loop()
  end

  defp send(value) do
    res = Sensors.Sender.send(
      %Sensors.SenderData{
        data: %{
          hydration: %{
            measured_at: DateTime.utc_now(),
            value: value,
            sensor_name: "hydrations_1"
          }
        },
        endpoint: "hydrations"
      }
    )
  end
end
