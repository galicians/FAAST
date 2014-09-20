require 'Passenger'


describe Passenger do

	it "should be initialized with a origin" do
		passenger = Passenger.new
		expect(passenger.origin).not_to eq(nil) 
	end

	it "should be initialized with a destination" do
		passenger = Passenger.new
		expect(passenger.destination).not_to eq(nil)
	end



end