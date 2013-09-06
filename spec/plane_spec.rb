require 'plane'

describe Plane do
	let(:plane) {Plane.new}
	
	it 'checks to see if it is sunny at the airport' do
		target_airport = double :airport, :current_weather_condition => :sunny
		
		expect(plane.good_flying_conditions? target_airport ).to be_true
	end

	it 'can take off' do
		target_airport = double :airport
		target_airport.should_receive(:current_weather_condition).and_return(:sunny)

		original_airport = double :airport
		original_airport.should_receive(:send_off).and_return(:plane)

		expect(plane.take_off_from original_airport,target_airport ).to eq :plane
	end


	it 'cannot take off when it is stormy' do
		target_airport = double :airport
		target_airport.stub(:current_weather_condition).and_return(:stormy)
		original_airport = double :airport
		original_airport.stub(:send_off).and_return(:plane)
		
		expect(plane.take_off_from original_airport,target_airport ).to be_nil
	end

	it 'cannot land if the target airport has stormy weather' do
		target_airport = double :airport
		target_airport.stub(:current_weather_condition).and_return(:sunny)
		target_airport.stub(:full?).and_return(:true)

		expect(plane.land_at target_airport ).to be_nil
	end

	it 'cannot land at a full airport' do
		target_airport = double :airport
		target_airport.stub(:current_weather_condition).and_return(:sunny)
		target_airport.stub(:full?).and_return(:true)

		expect(plane.land_at target_airport ).to be_nil
	end
end
