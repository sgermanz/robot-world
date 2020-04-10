# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

carModels = CarModel.create(
    [
        { 
            name: "Phoebe",
            cost: 100000,
            price: 200000,
            minStock: 100
        }, 
        { 
            name: "Ganymede",
            cost: 200000,
            price: 400000,
            minStock: 90
        }, 
        { 
            name: "Callisto",
            cost: 300000,
            price: 600000,
            minStock: 80
        }, 
        { 
            name: "Deimos",
            cost: 400000,
            price: 800000,
            minStock: 70
        }, 
        { 
            name: "Titan",
            cost: 500000,
            price: 100000,
            minStock: 60
        }, 
        { 
            name: "Europa",
            cost: 600000,
            price: 1200000,
            minStock: 50
        }, 
        { 
            name: "Io",
            cost: 700000,
            price: 1400000,
            minStock: 40
        }, 
        { 
            name: "Hyperion",
            cost: 800000,
            price: 1600000,
            minStock: 30
        }, 
        { 
            name: "Rhea",
            cost: 900000,
            price: 1800000,
            minStock: 20
        }, 
        { 
            name: "Phobos",
            cost: 1000000,
            price: 2000000,
            minStock: 10
        }
    ]
)

