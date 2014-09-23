require 'station'



describe Station do
	
	let(:station0) { Station.new }
	let(:station1) { Station.new }
	let(:station2) { Station.new }
	let(:station3) { Station.new }
	let(:passenger) { Passenger.new(station1,station2) }
	let(:train) { Train.new }
	let(:coach) { Coach.new }

	it 'should hold passengers' do
		station1.hold(passenger)
		expect(station1.count).to eq(1)
	end

	it 'should update the origin of the passenger when holds the passenger' do
		station3 = Station.new
		station3.hold(passenger)
		expect(passenger.origin).to eq(station3)
	end

	it 'should have a finite capacity' do
		200.times { station0.hold(passenger) }
		expect{ station0.hold(passenger) }.to raise_error("RuntimeError")
	end


	it 'should deliver passengers to the right train' do
		train.hold(coach)
		train.route(station1,station2,station3)
		5.times { station1.hold(Passenger.new(station1,station2)) }
		12.times { station1.hold(Passenger.new(station1,station3)) }
		station1.deliver(train)
		expect(station1.passengers.count).to eq 0
	end

end