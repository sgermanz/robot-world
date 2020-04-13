require 'rails_helper'

RSpec.describe Computer, type: :model do
  it 'should set basic structure' do
    computer = Computer.create
    computer.setBasicStructure
    status = JSON.parse computer.status

    expect(status["wheel1"].nil?).to eq(false)
    expect(status["wheel2"].nil?).to eq(false)
    expect(status["wheel3"].nil?).to eq(false)
    expect(status["wheel4"].nil?).to eq(false)
    expect(status["seat1"].nil?).to eq(false)
    expect(status["seat2"].nil?).to eq(false)
    expect(status["chassis"].nil?).to eq(false)
    expect(status["computer"].nil?).to eq(false)

  end
  it 'should set electronic devices' do
    computer = Computer.create
    computer.setBasicStructure
    computer.setElectronicDevices
    status = JSON.parse computer.status

    expect(status["laser"].nil?).to eq(false)
  end
end
