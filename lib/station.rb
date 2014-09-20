# require_relative 'Passenger'

class Station

	DEFAULT_CAPACITY = 200

	def initialize
		@passengers = []
	end

	def hold(passenger)
		raise '#{self.class.to_s} does not accept more #{passenger.class.to_s}' if count == DEFAULT_CAPACITY
		@passengers << passenger
	end

	def count
		@passengers.size
	end


end