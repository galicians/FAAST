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
		passengers_to_be_delivered = []
		passengers.each do |passenger|
			if train.itinerary.include?passenger.destination
				train.board(passenger)
				passengers_to_be_delivered << passenger
			end
		end
		@passengers = @passengers - passengers_to_be_delivered
	end


	

end
