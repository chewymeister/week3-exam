class Weather

	def initialize
		@potential_weather_conditions = [:sunny, :stormy]
	end

	def current_condition
		@potential_weather_conditions.sample
	end

end