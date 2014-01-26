require_relative 'helper'
	
class Orbit_runner

	def self.run(attrs = {})
		@bodies = attrs.fetch(:bodies, [Free_body.new(mass: 10, x: 100, y: 100, vel_x: -5, vel_y: -1),
																		Free_body.new(mass:1000)])
		@output = attrs[:output] ? File.open(attrs[:output], 'w') : $stdout

		10000.times do 
			@bodies.each do |body|
				Orbiter.calc_grav_acc(body, @bodies)
				Orbiter.update_position(body)
				Orbiter.calc_grav_acc(body, @bodies)
				Orbiter.update_velocity(body)
			end
			Orbiter.track(@output, @bodies)
		end

		@output.close
	
		puts "Thanks for running!"
	end
end