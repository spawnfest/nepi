defmodule Sensors.Hydration do
  @input_pin Application.get_env(:sensors, :input_pin)

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
      {:gpio_interrupt, p, :rising} ->
        Logger.debug "Received dehydration on pin #{p}"
      {:gpio_interrupt, p, :falling} ->
        Logger.debug "Received hydration on pin #{p}"
    end
    listen_loop()
  end

end
