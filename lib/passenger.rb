
class Passenger
	
	attr_accessor :origin, :destination, :money

	def initialize(origin ='', destination='')
		@origin = origin
		@destination = destination
		@money = 2
	end

	def spend_money(charge)
		@money < charge ? (raise Exception.new("not enougth money")) : @money -= charge
	end
	
end