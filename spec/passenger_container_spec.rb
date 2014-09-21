require 'passenger_container'
require 'passenger'

class ContainerHolder; include PassengerContainer; end



# it 'should release passengers' do


describe PassengerContainer do

	let(:station1) { Station.new }
	let(:station2) { Station.new }
	let(:passenger) { Passenger.new(station1,station2) }
	let(:holder) { ContainerHolder.new(:capacity => 200) }

	it 'should hold passengers' do
		holder.hold(passenger)
		expect(holder.passengers).to eq([passenger])
	end

	it 'should have a finity capacity' do
		200.times { holder.hold(passenger) }
		expect{ holder.hold(passenger) }.to raise_error("RuntimeError")
	end

	it 'should release passengers' do
		holder.hold(passenger)
		expect(holder.release).to eq(passenger)
	end

	it 'should know when it is full' do
		200.times { holder.hold(passenger) }
		expect(holder).to be_full
	end

end