require 'airport'

describe Airport do
	let(:airport) {Airport.new(7)}

	it 'contains a collection of planes' do
		expect(airport).not_to be_empty
	end

	it 'knows when it is full' do
		airport = Airport.new(5)

		expect(airport).to be_full
	end

	it 'can have maximum capacity decided when airport is created' do
		airport = Airport.new(5)

		expect(airport).to be_full
	end

	it 'can send off a plane' do
		plane = double :plane
		expect(airport.send_off ).to eq :plane
	end

	it 'takes one plane away from its depot every time a plane takes off' do
		plane = double :plane

		airport.send_off :plane
		
		expect(airport.number_of_planes).to eq 4
	end

	it 'adds one plane to the depot every time a plane lands' do
		plane = double :plane
		airport.receive_plane
		
		expect(airport.number_of_planes).to eq 6
	end

	it 'has sunny weather' do
		weather = double weather, :current_condition => :sunny
		
		expect(airport.current_weather_condition weather ).to eq :sunny
	end

	it 'has bomb scares' do
		airport.terrorist_attack!

		expect(airport.bomb_scare?).to be_true
	end

	it 'can call off a bomb scare' do
		expect(airport.call_off_a_bomb_scare!).to be_nil
	end

	it 'cannot send off planes if the airport has reached maximum capacity' do
		airport = Airport.new(5)

		expect(airport.send_off).to be_nil
	end

	it 'cannot receive planes if the airport has reached maximum capacity' do
		airport = Airport.new(5)

		expect(airport.receive_plane).to be_nil
	end

	it 'cannot send off planes if there is a bomb scare' do
		plane = double :plane
		airport.terrorist_attack!
	
		expect(airport.send_off plane).to be_nil
	end

	it 'cannot receive planes if there is a bomb scare' do
		plane = double :plane
		airport.terrorist_attack!

		expect(airport.receive_plane).to be_nil
	end

	it 'can send off a plane once a bomb scare has been called off' do
		airport.terrorist_attack!
		airport.send_off
		airport.call_off_a_bomb_scare!
		airport.send_off

		expect(airport.number_of_planes).to eq 4
	end

end