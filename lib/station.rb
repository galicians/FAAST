require_relative 'passenger_container'

class Station

	include PassengerContainer

	DEFAULT_CAPACITY = 200

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@passengers = []
	end

	def hold(passenger)
		raise 'RuntimeError' if count == DEFAULT_CAPACITY
		passenger.origin = self
		@passengers << passenger
	end

	def deliver(train)
		puts passengers.size
		passengers.each do |passenger|
			if train.stations.include?passenger.destination
				train.coaches.first.hold(passenger)
				puts passengers
				@passengers.delete(passenger)
			end
		end
	end

end
