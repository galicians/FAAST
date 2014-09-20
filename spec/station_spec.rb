require 'station'



describe Station do
	let(:passenger) { Passenger.new }
	let(:station) { Station.new }

	it 'should hold passengers' do
		station.hold(passenger)
		expect(station.count).to eq(1)
	end

	it 'should have a finite capacity' do
		200.times { station.hold(passenger) }
		expect{ station.hold(passenger) }.to raise_error("RuntimeError")
	end

	it 'should release passengers' do
		50.times { station.hold(passenger) }
		expect(station.release).to eq(passenger)
		expect(station.count).to eq(49)
	end

end