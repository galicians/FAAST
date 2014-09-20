
module PassengerContainer

	DEFAULT_CAPACITY = 40

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@passengers = []
	end

	def passengers
		@passengers
	end

	def capacity
		@capacity
	end
	
	def full?
		count == capacity
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