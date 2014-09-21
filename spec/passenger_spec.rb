require 'Passenger'


describe Passenger do

	let(:station1) { Station.new }
	let(:station2) { Station.new }
	let(:passenger) { Passenger.new(station1,station2) }
	
	it "should be initialized with a origin" do
		expect(passenger.origin).not_to eq(nil) 
	end

	it "should be initialized with a destination" do
		expect(passenger.destination).not_to eq(nil)
	end



end