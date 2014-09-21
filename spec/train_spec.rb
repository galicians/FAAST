require 'train'

describe Train do

	let(:train) { Train.new(:capacity => 20) }
	let(:coach) { Coach.new }
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

end