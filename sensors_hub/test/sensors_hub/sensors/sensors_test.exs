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

  describe "humidities" do
    alias SensorsHub.Sensors.Humidity

    @valid_attrs %{measured_at: "2010-04-17 14:00:00.000000Z", sensor_name: "some sensor_name", value: 120.5}
    @update_attrs %{measured_at: "2011-05-18 15:01:01.000000Z", sensor_name: "some updated sensor_name", value: 456.7}
    @invalid_attrs %{measured_at: nil, sensor_name: nil, value: nil}

    def humidity_fixture(attrs \\ %{}) do
      {:ok, humidity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sensors.create_humidity()

      humidity
    end

    test "list_humidities/0 returns all humidities" do
      humidity = humidity_fixture()
      assert Sensors.list_humidities() == [humidity]
    end

    test "get_humidity!/1 returns the humidity with given id" do
      humidity = humidity_fixture()
      assert Sensors.get_humidity!(humidity.id) == humidity
    end

    test "create_humidity/1 with valid data creates a humidity" do
      assert {:ok, %Humidity{} = humidity} = Sensors.create_humidity(@valid_attrs)
      assert humidity.measured_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert humidity.sensor_name == "some sensor_name"
      assert humidity.value == 120.5
    end

    test "create_humidity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensors.create_humidity(@invalid_attrs)
    end

    test "update_humidity/2 with valid data updates the humidity" do
      humidity = humidity_fixture()
      assert {:ok, humidity} = Sensors.update_humidity(humidity, @update_attrs)
      assert %Humidity{} = humidity
      assert humidity.measured_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert humidity.sensor_name == "some updated sensor_name"
      assert humidity.value == 456.7
    end

    test "update_humidity/2 with invalid data returns error changeset" do
      humidity = humidity_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensors.update_humidity(humidity, @invalid_attrs)
      assert humidity == Sensors.get_humidity!(humidity.id)
    end

    test "delete_humidity/1 deletes the humidity" do
      humidity = humidity_fixture()
      assert {:ok, %Humidity{}} = Sensors.delete_humidity(humidity)
      assert_raise Ecto.NoResultsError, fn -> Sensors.get_humidity!(humidity.id) end
    end

    test "change_humidity/1 returns a humidity changeset" do
      humidity = humidity_fixture()
      assert %Ecto.Changeset{} = Sensors.change_humidity(humidity)
    end
  end

  describe "proximities" do
    alias SensorsHub.Sensors.Proximity

    @valid_attrs %{measured_at: "2010-04-17 14:00:00.000000Z", sensor_name: "some sensor_name", value: 120.5}
    @update_attrs %{measured_at: "2011-05-18 15:01:01.000000Z", sensor_name: "some updated sensor_name", value: 456.7}
    @invalid_attrs %{measured_at: nil, sensor_name: nil, value: nil}

    def proximity_fixture(attrs \\ %{}) do
      {:ok, proximity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sensors.create_proximity()

      proximity
    end

    test "list_proximities/0 returns all proximities" do
      proximity = proximity_fixture()
      assert Sensors.list_proximities() == [proximity]
    end

    test "get_proximity!/1 returns the proximity with given id" do
      proximity = proximity_fixture()
      assert Sensors.get_proximity!(proximity.id) == proximity
    end

    test "create_proximity/1 with valid data creates a proximity" do
      assert {:ok, %Proximity{} = proximity} = Sensors.create_proximity(@valid_attrs)
      assert proximity.measured_at == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert proximity.sensor_name == "some sensor_name"
      assert proximity.value == 120.5
    end

    test "create_proximity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensors.create_proximity(@invalid_attrs)
    end

    test "update_proximity/2 with valid data updates the proximity" do
      proximity = proximity_fixture()
      assert {:ok, proximity} = Sensors.update_proximity(proximity, @update_attrs)
      assert %Proximity{} = proximity
      assert proximity.measured_at == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert proximity.sensor_name == "some updated sensor_name"
      assert proximity.value == 456.7
    end

    test "update_proximity/2 with invalid data returns error changeset" do
      proximity = proximity_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensors.update_proximity(proximity, @invalid_attrs)
      assert proximity == Sensors.get_proximity!(proximity.id)
    end

    test "delete_proximity/1 deletes the proximity" do
      proximity = proximity_fixture()
      assert {:ok, %Proximity{}} = Sensors.delete_proximity(proximity)
      assert_raise Ecto.NoResultsError, fn -> Sensors.get_proximity!(proximity.id) end
    end

    test "change_proximity/1 returns a proximity changeset" do
      proximity = proximity_fixture()
      assert %Ecto.Changeset{} = Sensors.change_proximity(proximity)
    end
  end
end
