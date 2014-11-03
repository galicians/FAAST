class Train
	
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

	def number_passengers
	 	@coaches.inject(0) {|result,coach| result + coach.passengers.size }
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
		@coaches.each do |coach|
			return coach.hold(passenger) if !coach.full?
		end
	end

	def same_destination?(passenger)
		passenger.destination == current_station
	end

	def deliver_passengers_station(station)
		@coaches.each do |coach|
			coach.passengers.delete_if {|passenger| station.hold(passenger) if same_destination?(passenger)}
		end
	end

end