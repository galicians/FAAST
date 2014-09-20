require 'station'



describe Station do

	it 'should hold passengers' do
		passenger = Passenger.new
		station = Station.new
		station.hold(1)
		expect(station.count).to eq(1)

	end

end