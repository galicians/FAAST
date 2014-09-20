require 'coach'

describe Coach do

	let(:coach) { Coach.new }
	let(:passenger) { Passenger.new }

	it "should hold until 40 passengers" do
		40.times { coach.hold(passenger) }
		expect{ coach.hold(passenger) }.to raise_error('RuntimeError')
	end

	it "should release passengers" do
		coach.hold(passenger)
		expect(coach.count).to eq(1)
	end
end