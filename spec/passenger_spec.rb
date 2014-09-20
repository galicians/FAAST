require 'Passenger'


describe Passenger do

	let(:passenger) { Passenger.new }

	it "should be initialized with a origin" do
		expect(passenger.origin).not_to eq(nil) 
	end

	it "should be initialized with a destination" do
		expect(passenger.destination).not_to eq(nil)
	end



end