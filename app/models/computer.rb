class Computer < ApplicationRecord
  belongs_to :car

  def setBasicStructure
    status = {
      wheel1: self.defects,
      wheel2: self.defects,
      wheel3: self.defects,
      wheel4: self.defects,
      seat1: self.defects,
      seat2: self.defects,
      chassis: self.defects,
      computer: self.defects
    }
    self.status = status.to_json
    self.save
  end
  def setElectronicDevices
    status = JSON.parse self.status
    status["laser"] = self.defects
    self.status = status.to_json
    self.save
  end
  def defects
    defects = Array.new
    19.times do
      defects.push(true)
    end
    defects.push(false)
    return defects.sample
  end
end
