require 'coach'

describe Coach do

	let(:passenger) { Passenger.new }
	let(:coach) { Coach.new }

	it "should have 40 as a default capacity when initialized" do
		expect(coach.capacity).to eq 40
	end

	it "can accept a new capacity" do
		coach.capacity = 50
		expect(coach.capacity).to eq 50
	end

	it "should hold a passenger" do
		coach.hold(passenger)
		expect(coach.passengers).to include passenger
	end

	it "should know how many passengers are on board" do
		25.times { coach.hold(Passenger.new)}
		expect(coach.count).to eq 25
	end

	it "should know if it is full" do
		coach.capacity.times { coach.hold(Passenger.new) }
		expect(coach.full?).to be true
	end

	it "should hold until 40 passengers" do
		expect{ 41.times {coach.hold(passenger)} }.to raise_error("RuntimeError")
	end

end