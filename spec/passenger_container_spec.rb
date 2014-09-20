require 'passenger_container'
require 'passenger'

class ContainerHolder; include PassengerContainer; end



# it 'should release passengers' do


describe PassengerContainer do

	let(:holder) { ContainerHolder.new(:capacity => 200) }
	let(:passenger) { Passenger.new }

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