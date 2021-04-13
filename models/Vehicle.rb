class Vehicle
    attr_accessor :color, :plate

    def initialize(plate = '', color = '')
        self.color = color
        self.plate = plate
    end


    
    def getPlate
        return self.plate
    end
    
    def getColor
        return self.color
    end

    def setPlate(plate)
        self.plate = plate
    end
    
    def setColor(color)
        self.color = color
    end
end