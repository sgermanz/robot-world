class Guard
    def check 
        puts "I'm checking"
    end
    def notify (aCar)
        puts "Bulder build the car: " + aCar
        check
    end
end