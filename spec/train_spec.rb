require 'train'

describe Train do

	let(:train) { Train.new(:capacity => 20) }
	let(:coach) { Coach.new }
	let(:station2) { Station.new }
	let(:passenger) { Passenger.new(station2,station2) }
	# it 'should be made of a number of coaches' do
	# 	4.times { train.hold(coach) }
	# 	expect(train.count).to eq(4)
	# end


	it 'should hold coaches' do
		train.hold(coach)
		expect(train.coaches).to eq([coach])
	end

	it 'should accept a route' do
		station1 = Station.new
		station3 = Station.new
		station5 = Station.new
		train.route(station3,station5,station1)
		expect(train.stations).to eq([station3,station5,station1])
	end

	it 'it should be able to stop at a specific station' do
		train.current_station = station2
		expect(train.current_station).to eq(station2)
	end

	# it 'should board passengers' do
	# 	5.times {train.hold(Coach.new)}
	# 	80.times { train.board(Passenger.new) }
	# 	expect(train.coaches.first.count).to eq(40)
	# end

	it 'should release a passenger when arrives at destination' do

	end

end