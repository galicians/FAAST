require 'passenger_container'

class Train
	
	include PassengerContainer
	
	DEFAULT_CAPACITY = 10
	
	attr_accessor :coaches,:capacity,:current_station
	attr_reader :stations

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@coaches = []
		@stations = []
		@current_station = []
	end

	def hold(coach)
		raise 'RuntimeError' if count == capacity
		@coaches << coach
	end

	def count
		@coaches.size
	end

	def route(*stations)
		stations.each do |station|
			@stations << station
		end
	end

	def board(passenger)
		coaches.each do |coach|
			return coach.hold(passenger) if !coach.full?
		end
	end

	def deliver(station)
		puts 'inside deliver:'
		@coaches.each do |coach|
			coach.passengers.each do |passenger|
				puts passenger
			end
		end
		puts 'outside deliver'
	end

end