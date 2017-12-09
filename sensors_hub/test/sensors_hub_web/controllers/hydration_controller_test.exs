defmodule SensorsHubWeb.HydrationControllerTest do
  use SensorsHubWeb.ConnCase

  alias SensorsHub.Sensors
  alias SensorsHub.Sensors.Hydration

  @create_attrs %{measured_at: "2010-04-17T14:00:00.000000Z", sensor_name: "some sensor_name", value: 120.5}
  @update_attrs %{measured_at: "2011-05-18T15:01:01.000000Z", sensor_name: "some updated sensor_name", value: 456.7}
  @invalid_attrs %{measured_at: nil, sensor_name: nil, value: nil}

  def fixture(:hydration) do
    {:ok, hydration} = Sensors.create_hydration(@create_attrs)
    hydration
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all hydrations", %{conn: conn} do
      conn = get conn, hydration_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create hydration" do
    test "renders hydration when data is valid", %{conn: conn} do
      conn = post conn, hydration_path(conn, :create), hydration: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, hydration_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "measured_at" => "2010-04-17T14:00:00.000000Z",
        "sensor_name" => "some sensor_name",
        "value" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, hydration_path(conn, :create), hydration: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update hydration" do
    setup [:create_hydration]

    test "renders hydration when data is valid", %{conn: conn, hydration: %Hydration{id: id} = hydration} do
      conn = put conn, hydration_path(conn, :update, hydration), hydration: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, hydration_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "measured_at" => "2011-05-18T15:01:01.000000Z",
        "sensor_name" => "some updated sensor_name",
        "value" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, hydration: hydration} do
      conn = put conn, hydration_path(conn, :update, hydration), hydration: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete hydration" do
    setup [:create_hydration]

    test "deletes chosen hydration", %{conn: conn, hydration: hydration} do
      conn = delete conn, hydration_path(conn, :delete, hydration)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, hydration_path(conn, :show, hydration)
      end
    end
  end

  defp create_hydration(_) do
    hydration = fixture(:hydration)
    {:ok, hydration: hydration}
  end
end
