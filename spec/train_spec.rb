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

end