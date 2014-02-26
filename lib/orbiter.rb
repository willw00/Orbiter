require_relative 'orbit_helper.rb'

module Orbiter	

	class Orbit_runner

		def self.run(attrs = {})
			@bodies = attrs.fetch(:bodies, [Orbiter::Free_body.new(mass: 10, x: 100, y: 100, vel_x: -5, vel_y: -1),
																			Orbiter::Free_body.new(mass:1000)])
			@output = attrs[:output] ? File.open(attrs[:output], 'w') : $stdout
	
			10000.times do 
				@bodies.each do |body|
					Orbiter::Orbit_updater.calc_grav_acc(body, @bodies)
					Orbiter::Orbit_updater.update_position(body)
					Orbiter::Orbit_updater.calc_grav_acc(body, @bodies)
					Orbiter::Orbit_updater.update_velocity(body)
				end
				Orbiter::Orbit_updater.track(@output, @bodies)
			end
	
			@output.close
		
			puts "Thanks for running!"
		end
	end
end