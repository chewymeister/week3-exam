class Airport

	def initialize maximum_capacity
		@plane_depot = Array.new (5) {:plane}
		@maximum_capacity = maximum_capacity
		@bomb = nil
	end

	def number_of_planes
		@plane_depot.count
	end

	def empty?
		@plane_depot.empty?
	end

	def full?
		@plane_depot.count == @maximum_capacity
	end

	def send_off *plane
		if !bomb_scare? && !full?
		@plane_depot.pop
		end
	end

	def receive_plane *plane
		if !bomb_scare? && !full?
		@plane_depot.push :plane
		end
	end

	def current_weather_condition weather
		weather.current_condition
	end

	def terrorist_attack!
		@bomb = :bomb
	end

	def call_off_a_bomb_scare!
		@bomb = nil
	end

	def bomb_scare?
		!@bomb.nil?
	end

end