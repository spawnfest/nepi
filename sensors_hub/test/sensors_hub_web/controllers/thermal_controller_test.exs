defmodule SensorsHubWeb.ThermalControllerTest do
  use SensorsHubWeb.ConnCase

  alias SensorsHub.Sensors
  alias SensorsHub.Sensors.Thermal

  @create_attrs %{measured_at: "2010-04-17T14:00:00.000000Z", sensor_name: "some sensor_name", value: 120.5}
  @update_attrs %{measured_at: "2011-05-18T15:01:01.000000Z", sensor_name: "some updated sensor_name", value: 456.7}
  @invalid_attrs %{measured_at: nil, sensor_name: nil, value: nil}

  def fixture(:thermal) do
    {:ok, thermal} = Sensors.create_thermal(@create_attrs)
    thermal
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all thermals", %{conn: conn} do
      conn = get conn, thermal_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create thermal" do
    test "renders thermal when data is valid", %{conn: conn} do
      conn = post conn, thermal_path(conn, :create), thermal: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, thermal_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "measured_at" => "2010-04-17T14:00:00.000000Z",
        "sensor_name" => "some sensor_name",
        "value" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, thermal_path(conn, :create), thermal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update thermal" do
    setup [:create_thermal]

    test "renders thermal when data is valid", %{conn: conn, thermal: %Thermal{id: id} = thermal} do
      conn = put conn, thermal_path(conn, :update, thermal), thermal: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, thermal_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "measured_at" => "2011-05-18T15:01:01.000000Z",
        "sensor_name" => "some updated sensor_name",
        "value" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, thermal: thermal} do
      conn = put conn, thermal_path(conn, :update, thermal), thermal: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete thermal" do
    setup [:create_thermal]

    test "deletes chosen thermal", %{conn: conn, thermal: thermal} do
      conn = delete conn, thermal_path(conn, :delete, thermal)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, thermal_path(conn, :show, thermal)
      end
    end
  end

  defp create_thermal(_) do
    thermal = fixture(:thermal)
    {:ok, thermal: thermal}
  end
end
