require 'train'


describe Train do

	let(:train) { Train.new(:capacity => 20) }
	let(:coach) { Coach.new }
	let(:station) { Station.new }
	let(:passenger) { Passenger.new }

	def fill_train(train) 
		5.times { train.hold(Coach.new) }
		origin = Station.new
		train.current_station = station
		45.times { train.board(Passenger.new(origin,Station.new)) }
		55.times { train.board(Passenger.new(origin,station)) }
	end

	it "should have a default capacity of 10 when initialized" do
		expect(Train.new.capacity).to equal(10)
	end

	it "should not be at any station when initialized" do
		expect(train.current_station).to be nil
	end

	it 'should hold coaches' do
		train.hold(coach)
		expect(train.coaches).to include(coach)
	end

	it 'knows how many coaches are attached' do
		4.times { train.hold(coach) }
		expect(train.number_coaches).to be 4
	end

	it 'capacity can be specified when initialized' do
		big_train = Train.new(:capacity => 200)
		expect(big_train.capacity).to eq (200)
	end

	it 'should not accept more coaches after is full' do
		expect{ 21.times {train.hold(coach)} }.to raise_error("RuntimeError")
	end

	it 'should accept a route' do
		destination = Station.new
		train.route(station, destination)
		expect(train.itinerary).to eq([station,destination])
	end

	it 'should be able to stop at a specific station' do
		train.current_station = station
		expect(train.current_station).to eq(station)
	end

	it 'knows how many passengers are on board' do
		fill_train(train)
		expect(train.number_passengers).to eq(100)
	end

	it "knows when passenger destination and current station are the same" do
		train.current_station = station
		passenger.destination = station
		expect(train.same_destination?(passenger)).to eq true
	end

	it 'should release passengers when they arrive at destination' do
		fill_train(train)
		train.deliver_passengers_station(station)
		expect(station.number_passengers).to eq(55)
	end

end