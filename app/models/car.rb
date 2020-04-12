class Car < ApplicationRecord
  has_one :computer
  belongs_to :car_model

  # Lo correcto seria que cada auto vaya pasando secuencialmente por una linea de ensable atras de otro 

  def self.createRandomCar
    car = Car.new

    car = basicStructure(car)
    car = electronicDevices(car)
    car = paintingAndFinalDetails(car)
    
    return car
  end
  
  private 
  def self.basicStructure(car)
    carModel = CarModel.getRandomCarModel

    car.computer = Computer.new
    car.computer.setBasicStructure

    car.car_model_id = carModel.id
    car.assembly_stage = "basic_structure"
    car.year = Date.current.year
    car.completed = false

    car.save
  
    return car
  end
  def self.electronicDevices(car)
    car.computer.setElectronicDevices
    car.assembly_stage = "electronic_devices"
    car.completed = false
    car.save

    return car
  end
  def self.paintingAndFinalDetails(car)
    car.assembly_stage = "painting_and_final_details"
    car.completed = true
    car.save

    return car
  end
  def setCarASsemblyStage(car, assemblyStage)
    car.assembly_stage = assemblyStage
    car.save
  end

end
