class Station

	attr_accessor :capacity, :name, :passengers

	DEFAULT_CAPACITY = 200

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@passengers = []
		@name
	end

	def hold(passenger)
		raise 'RuntimeError' if number_passengers == DEFAULT_CAPACITY
		passenger.origin = self
		@passengers << passenger
	end


	def number_passengers
		@passengers.size
	end

	def passenger_destination_in_itinerary?(train,passenger)
		train.itinerary.include?passenger.destination
	end
	
	def deliver_passengers_train(train)
		@passengers.delete_if { |passenger| train.board(passenger) if passenger_destination_in_itinerary?(train,passenger) }
	end

	

end
