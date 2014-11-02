require 'train'

describe Train do

	let(:train) { Train.new(:capacity => 20) }
	let(:coach) { Coach.new }
	let(:station1) { Station.new }
	let(:station2) { Station.new }
	let(:station3) { Station.new }
	let(:passenger) { Passenger.new(station2,station2) }


	it "should have a default capacity of 10 when initialized" do
		expect(Train.new.capacity).to equal(10)
	end

	it "should not be at any station when initialized" do
		expect(train.current_station).to be nil
	end

	it 'should hold coaches' do
		expect(train.number_coaches).to eq(0)
		expect{ 21.times {train.hold(coach)} }.to raise_error("RuntimeError")
	end

	it 'should hold a limited number of coaches' do
		expect(train.capacity).to eq (20)
	end

	it 'should accept a route' do
		train.route(station3,station2,station1)
		expect(train.itinerary).to eq([station3,station2,station1])
	end

	it 'should be able to stop at a specific station' do
		train.current_station = station2
		expect(train.current_station).to eq(station2)
	end

	it "should board passengers on the first coach available" do
		3.times { train.hold(Coach.new) }
		100.times { train.board(Passenger.new(station2,station2)) }
		expect(train.coaches.last.count).to eq(20)
	end

	it 'should release passengers when they arrive at destination' do
		train.current_station = station2
		3.times { train.hold(Coach.new) }
		50.times { train.board(Passenger.new(station1,station2)) }
		50.times { train.board(Passenger.new(station1,station3)) }
		train.deliver(station2)
		expect(station2.count).to eq(50)
	end

end