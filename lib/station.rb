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
		# coach_test = Coach.new
		puts 'before going on passengers iterations:'
		puts passengers
		passengers.each do |passenger|
			if train.stations.include?passenger.destination
				train.coaches.first.hold(passenger)
				# @passengers.delete(passenger)
			end
		end

		puts 'at the end'
		puts train.coaches.first.passengers

	end

end
