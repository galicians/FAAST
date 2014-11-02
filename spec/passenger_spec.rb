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

	it "can accept an origin when created" do
		pablo = Passenger.new('origin')
		expect(pablo.origin).to eq 'origin'
	end

	it "can accept a destination when created" do
		pablo = Passenger.new('origin','destination')
		expect(pablo.destination).to eq 'destination'
	end

	it "will be initialized with money 2" do
		expect(passenger.money).to eq 2
	end

	it "will spend money" do
		passenger.spend_money(2)
		expect(passenger.money).to eq 0
	end

	it "will raise an exception if spends more than the current available amount" do
		expect{ passenger.spend_money(5) }.to raise_exception
	end

end