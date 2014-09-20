# require_relative 'Passenger'

class Station

	def initialize
		@passengers ||= []
	end

	def hold(passenger)
		@passengers << passenger
	end

	def count
		@passengers.size
	end

end