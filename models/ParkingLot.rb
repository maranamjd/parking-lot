class ParkingLot
    
    attr_accessor :slots

    def setSlots(slots)
        self.slots = Array.new(slots.to_i)
    end

    def getSlot(slot_no)
        return self.slots[slot_no]
    end

    def getSlotByPlate(plate)
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
        status = "\nSlot No. | Plate Number | Colour\n"
        self.slots.each_with_index {|vehicle, idx|
            if !vehicle.nil?
                status += "#{idx+1} | #{vehicle.getPlate} | #{vehicle.getColor}\n"
            # else
            #     status += "#{idx+1} | unoccupied | unoccupied\n"
            end
        }
        return status += "\n"
    end

    def leaveSlot(slot_no)
        idx = slot_no.to_i - 1
        if slot_no.to_i > self.slots.length() or slot_no.to_i < 0
            return "Parking slot does not exist"
        else
            if self.slots[idx].nil?
                return "Parking slot is unoccupied"
            end
            self.slots[idx] = nil
            return "Slot number #{slot_no} is free"
        end
    end

    def setToSlot(vehicle)
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

end