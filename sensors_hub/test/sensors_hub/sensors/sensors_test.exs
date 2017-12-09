defmodule SensorsHub.SensorsTest do
  use SensorsHub.DataCase

  alias SensorsHub.Sensors

  describe "hydrations" do
    alias SensorsHub.Sensors.Hydration

    @valid_attrs %{measured_at: "2010-04-17 14:00:00.000000Z", sensor_name: "some sensor_name", value: 120.5}
    @update_attrs %{measured_at: "2011-05-18 15:01:01.000000Z", sensor_name: "some updated sensor_name", value: 456.7}
    @invalid_attrs %{measured_at: nil, sensor_name: nil, value: nil}

    def hydration_fixture(attrs \\ %{}) do
      {:ok, hydration} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sensors.create_hydration()

      hydration
    end

    test "list_hydrations/0 returns all hydrations" do
      hydration = hydration_fixture()
      assert Sensors.list_hydrations() == [hydration]
    end

    test "get_hydration!/1 returns the hydration with given id" do
      hydration = hydration_fixture()
      assert Sensors.get_hydration!(hydration.id) == hydration
    end

    test "create_hydration/1 with valid data creates a hydration" do
      assert {:ok, %Hydration{} = hydration} = Sensors.create_hydration(@valid_attrs)
      assert hydration.measured_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert hydration.sensor_name == "some sensor_name"
      assert hydration.value == 120.5
    end

    test "create_hydration/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensors.create_hydration(@invalid_attrs)
    end

    test "update_hydration/2 with valid data updates the hydration" do
      hydration = hydration_fixture()
      assert {:ok, hydration} = Sensors.update_hydration(hydration, @update_attrs)
      assert %Hydration{} = hydration
      assert hydration.measured_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert hydration.sensor_name == "some updated sensor_name"
      assert hydration.value == 456.7
    end

    test "update_hydration/2 with invalid data returns error changeset" do
      hydration = hydration_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensors.update_hydration(hydration, @invalid_attrs)
      assert hydration == Sensors.get_hydration!(hydration.id)
    end

    test "delete_hydration/1 deletes the hydration" do
      hydration = hydration_fixture()
      assert {:ok, %Hydration{}} = Sensors.delete_hydration(hydration)
      assert_raise Ecto.NoResultsError, fn -> Sensors.get_hydration!(hydration.id) end
    end

    test "change_hydration/1 returns a hydration changeset" do
      hydration = hydration_fixture()
      assert %Ecto.Changeset{} = Sensors.change_hydration(hydration)
    end
  end

  describe "thermals" do
    alias SensorsHub.Sensors.Thermal

    @valid_attrs %{measured_at: "2010-04-17 14:00:00.000000Z", sensor_name: "some sensor_name", value: 120.5}
    @update_attrs %{measured_at: "2011-05-18 15:01:01.000000Z", sensor_name: "some updated sensor_name", value: 456.7}
    @invalid_attrs %{measured_at: nil, sensor_name: nil, value: nil}

    def thermal_fixture(attrs \\ %{}) do
      {:ok, thermal} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sensors.create_thermal()

      thermal
    end

    test "list_thermals/0 returns all thermals" do
      thermal = thermal_fixture()
      assert Sensors.list_thermals() == [thermal]
    end

    test "get_thermal!/1 returns the thermal with given id" do
      thermal = thermal_fixture()
      assert Sensors.get_thermal!(thermal.id) == thermal
    end

    test "create_thermal/1 with valid data creates a thermal" do
      assert {:ok, %Thermal{} = thermal} = Sensors.create_thermal(@valid_attrs)
      assert thermal.measured_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert thermal.sensor_name == "some sensor_name"
      assert thermal.value == 120.5
    end

    test "create_thermal/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensors.create_thermal(@invalid_attrs)
    end

    test "update_thermal/2 with valid data updates the thermal" do
      thermal = thermal_fixture()
      assert {:ok, thermal} = Sensors.update_thermal(thermal, @update_attrs)
      assert %Thermal{} = thermal
      assert thermal.measured_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert thermal.sensor_name == "some updated sensor_name"
      assert thermal.value == 456.7
    end

    test "update_thermal/2 with invalid data returns error changeset" do
      thermal = thermal_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensors.update_thermal(thermal, @invalid_attrs)
      assert thermal == Sensors.get_thermal!(thermal.id)
    end

    test "delete_thermal/1 deletes the thermal" do
      thermal = thermal_fixture()
      assert {:ok, %Thermal{}} = Sensors.delete_thermal(thermal)
      assert_raise Ecto.NoResultsError, fn -> Sensors.get_thermal!(thermal.id) end
    end

    test "change_thermal/1 returns a thermal changeset" do
      thermal = thermal_fixture()
      assert %Ecto.Changeset{} = Sensors.change_thermal(thermal)
    end
  end
end
