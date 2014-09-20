# require_relative 'Passenger'

class Station

	DEFAULT_CAPACITY = 200

	def initialize
		@passengers = []
	end

	def hold(passenger)
		raise 'RuntimeError' if count == DEFAULT_CAPACITY
		@passengers << passenger
	end

	def count
		@passengers.size
	end

	def release
		@passengers.pop
	end


end