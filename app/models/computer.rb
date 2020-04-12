class Computer < ApplicationRecord
  belongs_to :car

  def setBasicStructure
    status = {
      wheel1: [true, false].sample,
      wheel2: [true, false].sample,
      wheel3: [true, false].sample,
      wheel4: [true, false].sample,
      seat1: [true, false].sample,
      seat2: [true, false].sample,
      chassis: [true, false].sample,
      computer: [true, false].sample
    }
    self.status = status.to_json
    self.save
  end
  def setElectronicDevices
    status = JSON.parse self.status
    status["laser"] = [true, false].sample
    self.status = status.to_json
    self.save
  end
end
