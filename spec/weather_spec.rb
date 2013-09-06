require 'weather'

describe Weather do
	let(:weather) {Weather.new}

	it 'can be sunny' do
		weather = double weather, :current_condition => :sunny
		
		expect(weather.current_condition).to eq :sunny
	end

	it 'can be stormy' do
		weather = double weather, :current_condition => :stormy
		
		expect(weather.current_condition).to eq :stormy
	end
end