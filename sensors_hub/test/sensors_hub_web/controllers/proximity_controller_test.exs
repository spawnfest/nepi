defmodule SensorsHubWeb.ProximityControllerTest do
  use SensorsHubWeb.ConnCase

  alias SensorsHub.Sensors
  alias SensorsHub.Sensors.Proximity

  @create_attrs %{measured_at: "2010-04-17 14:00:00.000000Z", sensor_name: "some sensor_name", value: 120.5}
  @update_attrs %{measured_at: "2011-05-18 15:01:01.000000Z", sensor_name: "some updated sensor_name", value: 456.7}
  @invalid_attrs %{measured_at: nil, sensor_name: nil, value: nil}

  def fixture(:proximity) do
    {:ok, proximity} = Sensors.create_proximity(@create_attrs)
    proximity
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all proximities", %{conn: conn} do
      conn = get conn, proximity_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create proximity" do
    test "renders proximity when data is valid", %{conn: conn} do
      conn = post conn, proximity_path(conn, :create), proximity: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, proximity_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "measured_at" => "2010-04-17 14:00:00.000000Z",
        "sensor_name" => "some sensor_name",
        "value" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, proximity_path(conn, :create), proximity: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update proximity" do
    setup [:create_proximity]

    test "renders proximity when data is valid", %{conn: conn, proximity: %Proximity{id: id} = proximity} do
      conn = put conn, proximity_path(conn, :update, proximity), proximity: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, proximity_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "measured_at" => "2011-05-18 15:01:01.000000Z",
        "sensor_name" => "some updated sensor_name",
        "value" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, proximity: proximity} do
      conn = put conn, proximity_path(conn, :update, proximity), proximity: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete proximity" do
    setup [:create_proximity]

    test "deletes chosen proximity", %{conn: conn, proximity: proximity} do
      conn = delete conn, proximity_path(conn, :delete, proximity)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, proximity_path(conn, :show, proximity)
      end
    end
  end

  defp create_proximity(_) do
    proximity = fixture(:proximity)
    {:ok, proximity: proximity}
  end
end
