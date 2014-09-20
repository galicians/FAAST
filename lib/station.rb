require_relative 'passenger_container'

class Station

	include PassengerContainer

	DEFAULT_CAPACITY = 200

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@passengers = []
	end

	# def hold(passenger)
	# 	raise 'RuntimeError' if count == DEFAULT_CAPACITY
	# 	@passengers << passenger
	# end

	# def count
	# 	@passengers.size
	# end

	# def release
	# 	@passengers.pop
	# end


end
