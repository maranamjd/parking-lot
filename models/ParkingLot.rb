class ParkingLot
    
    attr_accessor :slots

    # def initialize(slot = 6)
    #     self.slots = Array.new(slot.to_i)
    # end


    def setSlots(slots)
        self.slots = Array.new(slots.to_i)
    end

    def getSlot(slot_no)
        return self.slots[slot_no]
    end

    def getSlotByPlate(plate)
        if !self.checkParkingSlot
            return "Please set parking lot slots" 
        end
        slot = 'Not found'
        self.slots.each_with_index {|vehicle, idx|
            if !vehicle.nil?
                if vehicle.getPlate.include? plate
                    slot = idx + 1
                end
            end
        }
        return slot
    end

    def getSlotsByColor(color)
        if !self.checkParkingSlot
            return "Please set parking lot slots" 
        end
        plates = ""
        self.slots.each_with_index {|vehicle, idx|
            if !vehicle.nil?
                if vehicle.getColor.include? color
                    plates += "#{idx+1}, "
                end
            end
        }
        return plates.delete_suffix(', ')
    end

    def getPlatesByColor(color)
        if !self.checkParkingSlot
            return "Please set parking lot slots" 
        end
        plates = ""
        self.slots.each_with_index {|vehicle, idx|
            if !vehicle.nil?
                if vehicle.getColor.include? color
                    plates += "#{vehicle.getPlate}, "
                end
            end
        }
        return plates.delete_suffix(', ')
    end

    def getStatus
        if !self.checkParkingSlot
            return "Please set parking lot slots" 
        end
        status = "\n"
        self.slots.each_with_index {|vehicle, idx|
            if !vehicle.nil?
                status += "#{idx+1} | #{vehicle.getPlate} | #{vehicle.getColor}\n"
            end
        }
        return status
    end

    def leaveSlot(slot_no)
        if !self.checkParkingSlot
            return "Please set parking lot slots" 
        end
        idx = slot_no.to_i - 1
        if self.slots[idx].nil?
            return "Parking slot does not exist"
        end
        self.slots[idx] = nil
        return "Slot number #{slot_no} is free"
    end

    def setToSlot(vehicle)
        if !self.checkParkingSlot
            return "Please set parking lot slots" 
        end
        has_slot = false
        allocated_slot = nil
        self.slots.each_with_index {|val, idx|
            if val.nil?
                self.slots[idx] = vehicle
                has_slot = true
                allocated_slot = idx + 1
                break
            end
        }
        if !has_slot
            return "Sorry, parking lot is full"
        else
            return "Allocated slot number: #{allocated_slot}"
        end
    end

    def checkParkingSlot
        if self.slots.nil?
            return false
        end
    end
end