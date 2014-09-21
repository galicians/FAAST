require 'coach'

describe Coach do

	let(:station1) { Station.new }
	let(:station2) { Station.new }
	let(:passenger) { Passenger.new(station1,station2) }
	let(:coach) { Coach.new }

	# it "should hold until 40 passengers" do
	# 	40.times { coach.hold(passenger) }
	# 	expect{ coach.hold(passenger) }.to raise_error('RuntimeError')
	# end

	# it "should release passengers" do
	# 	coach.hold(passenger)
	# 	expect(coach.count).to eq(1)
	# end
end