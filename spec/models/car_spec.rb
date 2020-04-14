require 'rails_helper'

RSpec.describe Car, type: :model do
  it "set basic structure" do
    car = Car.new
    car = Car.basicStructure(car)

    expect(car.computer.nil?).to eq(false)
    expect(car.car_model_id.nil?).to eq(false)
    expect(car.assembly_stage).to eq("basic_structure")
    expect(car.year).to eq(Date.current.year)
    expect(car.completed).to eq(false)
  end
  it "set electronic devices" do
    car = Car.new

    car = Car.basicStructure(car)
    car = Car.electronicDevices(car)

    expect(car.computer.nil?).to eq(false)
    expect(car.car_model_id.nil?).to eq(false)
    expect(car.assembly_stage).to eq("electronic_devices")
    expect(car.year).to eq(Date.current.year)
    expect(car.completed).to eq(false)
  end
  it "set painting and final details" do
    car = Car.new

    car = Car.basicStructure(car)
    car = Car.electronicDevices(car)
    car = Car.paintingAndFinalDetails(car)


    expect(car.computer.nil?).to eq(false)
    expect(car.car_model_id.nil?).to eq(false)
    expect(car.assembly_stage).to eq("painting_and_final_details")
    expect(car.year).to eq(Date.current.year)
    expect(car.completed).to eq(true)
  end
end
