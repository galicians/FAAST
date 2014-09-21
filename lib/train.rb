require 'passenger_container'

class Train
	
	include PassengerContainer
	
	DEFAULT_CAPACITY = 10
	
	attr_accessor :coaches,:capacity
	attr_reader :stations

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@coaches = []
		@stations = []
	end
	
	# def full?
	# 	count == capacity
	# end

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



end