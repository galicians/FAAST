require 'passenger_container'

class Coach

	include PassengerContainer
	attr_accessor :passengers

	DEFAULT_CAPACITY = 40

	def initialize
		@capacity = DEFAULT_CAPACITY
		@passengers = []
	end

	def hold(passenger)
		raise 'RuntimeError' if count == capacity
		@passengers << passenger
	end

	def count
		@passengers.size
	end

	def full?
		passengers.count == @capacity
	end
end