require_relative 'passenger_container'

class Coach

	include PassengerContainer

	DEFAULT_CAPACITY = 40

	def initialize
		@capacity = DEFAULT_CAPACITY
		@passengers = []
	end


end