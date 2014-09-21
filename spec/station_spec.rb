require 'station'



describe Station do
	

	let(:station1) { Station.new }
	let(:station2) { Station.new }
	let(:passenger) { Passenger.new(station1,station2) }

	it 'should hold passengers' do
		station1.hold(passenger)
		expect(station1.count).to eq(1)
	end

	it 'should have a finite capacity' do
		200.times { station1.hold(passenger) }
		expect{ station1.hold(passenger) }.to raise_error("RuntimeError")
	end

	it 'should release passengers' do
		50.times { station1.hold(passenger) }
		expect(station1.release).to eq(passenger)
		expect(station1.count).to eq(49)
	end


end