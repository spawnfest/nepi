defmodule SensorsHubWeb.HumidityControllerTest do
  use SensorsHubWeb.ConnCase

  alias SensorsHub.Sensors
  alias SensorsHub.Sensors.Humidity

  @create_attrs %{measured_at: "2010-04-17 14:00:00.000000Z", sensor_name: "some sensor_name", value: 120.5}
  @update_attrs %{measured_at: "2011-05-18 15:01:01.000000Z", sensor_name: "some updated sensor_name", value: 456.7}
  @invalid_attrs %{measured_at: nil, sensor_name: nil, value: nil}

  def fixture(:humidity) do
    {:ok, humidity} = Sensors.create_humidity(@create_attrs)
    humidity
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all humidities", %{conn: conn} do
      conn = get conn, humidity_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create humidity" do
    test "renders humidity when data is valid", %{conn: conn} do
      conn = post conn, humidity_path(conn, :create), humidity: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, humidity_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "measured_at" => "2010-04-17 14:00:00.000000Z",
        "sensor_name" => "some sensor_name",
        "value" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, humidity_path(conn, :create), humidity: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update humidity" do
    setup [:create_humidity]

    test "renders humidity when data is valid", %{conn: conn, humidity: %Humidity{id: id} = humidity} do
      conn = put conn, humidity_path(conn, :update, humidity), humidity: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, humidity_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "measured_at" => "2011-05-18 15:01:01.000000Z",
        "sensor_name" => "some updated sensor_name",
        "value" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, humidity: humidity} do
      conn = put conn, humidity_path(conn, :update, humidity), humidity: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete humidity" do
    setup [:create_humidity]

    test "deletes chosen humidity", %{conn: conn, humidity: humidity} do
      conn = delete conn, humidity_path(conn, :delete, humidity)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, humidity_path(conn, :show, humidity)
      end
    end
  end

  defp create_humidity(_) do
    humidity = fixture(:humidity)
    {:ok, humidity: humidity}
  end
end
