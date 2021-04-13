require_relative '../models/Vehicle'
require_relative '../models/ParkingLot'


class Command
    attr_accessor :command, :input_1, :input_2, :parking_lot, :vehicle

    def initialize
        self.parking_lot = ParkingLot.new
    end
    
    def setInput(command)
        data = command.split(' ')
        self.command = data[0]
        self.input_1 = data[1]
        self.input_2 = data[2]
    end

    def process
        output = ""
        case self.command
        when "create_parking_lot"
            if self.input_1.nil?
                return "Please provide no of slots"
            end
            self.parking_lot.setSlots(self.input_1)
            output = "Created a parking lot with #{self.input_1} slots"
        when "park"
            if self.input_1.nil?
                return "Please provide registration number"
            elsif self.input_2.nil?
                return "Please provide vehicle color"
            end
            vehicle = Vehicle.new(self.input_1, self.input_2)
            output = self.parking_lot.setToSlot(vehicle)

        when "leave"
            if self.input_1.nil?
                return "Please provide slot no"
            end
            output = self.parking_lot.leaveSlot(self.input_1)
        when "status"
            output = self.parking_lot.getStatus()
        when "plate_numbers_for_cars_with_colour"
            if self.input_1.nil?
                return "Please provide vehicle color"
            end
            output = self.parking_lot.getPlatesByColor(self.input_1)
        when "slot_numbers_for_cars_with_colour"
            if self.input_1.nil?
                return "Please provide vehicle color"
            end
            output = self.parking_lot.getSlotsByColor(self.input_1)
        when "slot_number_for_registration_number"
            if self.input_1.nil?
                return "Please provide registration number"
            end
            output = self.parking_lot.getSlotByPlate(self.input_1)
        else
            return "Command does not exist"
        end
        return output
    end
end