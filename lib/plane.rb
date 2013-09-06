class Plane

	def good_flying_conditions? target_airport
		target_airport.current_weather_condition == :sunny
	end


	def take_off_from original_airport,target_airport
		if good_flying_conditions? target_airport
			original_airport.send_off
		end
	end

	def land_at target_airport
		if (good_flying_conditions? target_airport) && (!target_airport.full?)
			target_airport.receive_plane
		end
	end
end