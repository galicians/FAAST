require 'station'


describe Station do
	
	let(:station) { Station.new }
	let(:destination) { Station.new }
	let(:passenger) { Passenger.new(station,destination) }
	let(:train) { Train.new }
	let(:coach) { Coach.new }

	def setting_train
		train.route(station, destination)
		train.hold(Coach.new)
	end

	def filling_station
		25.times { station.hold(Passenger.new(station,destination)) }
		station.deliver_passengers_train(train)
	end

	it 'should hold passengers' do
		station.hold(passenger)
		expect(station.number_passengers).to eq(1)
	end

	it "should accept a name" do
		station.name = 'Oxford circus'
		expect(station.name).to eq 'Oxford circus'
	end

	it 'should update the origin of the passenger when holds the passenger' do
		station.hold(passenger)
		expect(passenger.origin).to eq(station)
	end

	it 'should have a finite capacity' do
		200.times { station.hold(passenger) }
		expect{ station.hold(passenger) }.to raise_error("RuntimeError")
	end

	it "knows when the passenger destination matches the train itinerary" do
		train.route(station, destination)
		expect(station.passenger_destination_in_itinerary?(train,passenger)).to be true
	end

	it 'should deliver passengers to the train' do
		setting_train
		filling_station
		expect(train.number_passengers).to eq 25
	end

	it "passengers that get into the train are removed from the station" do
		setting_train
		filling_station
		expect(station.number_passengers).to eq 0
	end

end