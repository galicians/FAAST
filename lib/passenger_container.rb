
module PassengerContainer

	
	def passengers
		@passengers
	end

	def capacity
		@capacity
	end
	def hold(passenger)
		raise 'RuntimeError' if count == capacity
		passengers << passenger
	end

	def count
		passengers.size
	end

	def release
		passengers.pop
	end

end