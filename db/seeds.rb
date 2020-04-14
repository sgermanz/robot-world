# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

modelNames = ["Phoebe", "Ganymede", "Callisto", "Deimos", "Titan", "Europa", "Io", "Hyperion", "Rhea", "Phobos"]
models = Array.new
modelNames.each do |name|
    model = Hash.new
    model[:name] = name
    model[:cost] = (100000..1000000).to_a.sample
    model[:price] = model[:cost] * 2
    models.push(model)
end
carModels = CarModel.create(models)

storeConfiguration = {
    buyer_schedule: 10,
    maximun_changes: 1,
    min_stock: Hash.new
}

carModels.each do |carModel|
    storeConfiguration[:min_stock][carModel.id] = (1..100).to_a.sample
end

storeConfigurations = StoreConfiguration.create(configuration: storeConfiguration.to_json)