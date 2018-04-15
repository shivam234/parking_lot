# Parking Lot class
class ParkingLot
	attr_accessor :car_slots

	def initialize(n = nil)
		@car_slots = Hash[[*(1..n.to_i)].each_with_object({}).to_a]
	end

	def create_parking_lot cars_count
   	@car_slots = Hash[[*(1..cars_count.to_i)].each_with_object({}).to_a]
		p "Created a parking lot with #{@car_slots.size} slots".gsub /"/, '|'
	end

	def park registration_no, color
		slot = @car_slots.find{|k,v| v=={}}
		if slot
		 	@car_slots[slot[0]] = {registration_no: registration_no, color: color}
		 	p "Allocated slot number: #{slot[0]}"
		else
			p "Sorry, parking lot is full"
		end
	end

	def leave slot_no
  	slot_no = slot_no.to_i
  	if @car_slots[slot_no]
  		@car_slots[slot_no] = {}
			p "Slot number #{slot_no} is free"
  	end
	end

	def status
		p "Slot No.  Registration No  Color"
		@car_slots.each do |key, value|
  		p "#{key}  #{value[:registration_no]}  #{value[:color]}" if @car_slots[key].any?
		end
	end

	def registration_numbers_for_cars_with_colour color
		registration_numbers = @car_slots.select{|k,v| @car_slots[k][:color] == color}.map{|k,v| v[:registration_no]}
		registration_numbers.size > 0 ? p(registration_numbers.join(", ")) :	p("Not found")
	end

	def slot_numbers_for_cars_with_colour color
		slots = @car_slots.select{|k,v| @car_slots[k][:color] == color}.keys
		slots.size > 0 ? p(slots.join(", ")) :	p("Not found")
	end

	def slot_number_for_registration_number registration_no
    slots = @car_slots.select{|k,v| @car_slots[k][:registration_no] == registration_no}.keys
		slots.size > 0 ? p(slots.join(", ")) :	p("Not found")
	end

  #interpreting commands
	def read_input input
    a = input.split(" ")
   send(a[0], *a[1..-1])
	end

end






