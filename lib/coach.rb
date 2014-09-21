require 'passenger_container'

class Coach

	include PassengerContainer

	DEFAULT_CAPACITY = 40

	def initialize
		@capacity = DEFAULT_CAPACITY
		@passengers = []
	end

	def hold(passenger)
		raise 'RuntimeError' if count == capacity
		puts 'interaction in coach.hold: '
		puts 'holding'
		@passengers << passenger
	end

	def count
		@passengers.size
	end


end