class Coach

	attr_accessor :passengers, :capacity

	DEFAULT_CAPACITY = 40

	def initialize
		@capacity = DEFAULT_CAPACITY
		@passengers = []
	end

	def hold(passenger)
		raise 'RuntimeError' if full?
		@passengers << passenger
	end

	def count
		@passengers.size
	end

	def full?
		@passengers.count == @capacity
	end
end