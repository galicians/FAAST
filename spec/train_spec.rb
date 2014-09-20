require 'train'

describe Train do

	let(:train) { Train.new }
	let(:coach) { Coach.new }
	it 'should be made of a number of coaches' do
		4.times { train.hold(coach) }
		expect(train.count).to eq(4)
	end
	
end