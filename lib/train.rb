require 'passenger_container'

class Train
	
	include PassengerContainer
	
	DEFAULT_CAPACITY = 10
	
	attr_accessor :coaches,:capacity,:current_station
	attr_reader :itinerary

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@coaches = []
		@itinerary = []
		@current_station
	end

	def hold(coach)
		raise 'RuntimeError' if number_coaches == capacity
		@coaches << coach
	end

	def number_coaches
		@coaches.size
	end

	def route(*stations)
		stations.each do |station|
			@itinerary << station
		end
	end

	def board(passenger)
		coaches.each do |coach|
			return coach.hold(passenger) if !coach.full?
		end
	end

	def deliver(station)
		passengers_delivered = []
		@coaches.each do |coach|
			coach.passengers.each do |passenger|
				if passenger.destination == current_station
					station.hold(passenger)
					passengers_delivered << passenger
				end
			end
			coach.passengers = coach.passengers - passengers_delivered
		end

	end

end