class Builder
    @guard
    def build
        puts "I'm building"
        if !@guard.nil?
            puts "there's a guard"
            @guard.notify('some car') 
        end
    end
    def setGuard (aGuard)
        @guard = aGuard
    end
end