module Orbiter
	class Orbit_updater
	
		#Changing these breaks tests, which expect both to = 1
		G_CONSTANT = 1
		TIME_CONSTANT = 1
	
		def self.calc_dist(body_a, body_b)
			Math.sqrt( (body_a.x - body_b.x)**2 + (body_a.y - body_b.y)**2 )
		end
	
		def self.calc_grav_acc(target, other_bodies)
			target.old_acc_x = target.acc_x
			target.old_acc_y = target.acc_y
			target.acc_x = 0.0
			target.acc_y = 0.0
			other_bodies.each do |other_body|
				if (dist = calc_dist(target, other_body)) > 0
					acc = G_CONSTANT*other_body.mass / (dist ** 2)
					target.acc_x += acc * Math.cos(calc_angle(target, other_body)) 
					target.acc_y += acc * Math.sin(calc_angle(target, other_body))
				end
			end
		end
	
		def self.calc_angle(body_a, body_b)
			y_diff = body_b.y - body_a.y
			x_diff = body_b.x - body_a.x
			Math.atan2(y_diff, x_diff)
		end
	
		def self.update_velocity(target)
			#binding.pry
			target.vel_x += TIME_CONSTANT * (target.old_acc_x + target.acc_x ) / 2
			target.vel_y += TIME_CONSTANT * (target.old_acc_y + target.acc_y ) / 2
		end
	
		def self.update_position(target)
			target.x += TIME_CONSTANT * ( target.vel_x + TIME_CONSTANT * target.acc_x / 2 )
			target.y += TIME_CONSTANT * ( target.vel_y + TIME_CONSTANT * target.acc_y / 2 )
		end
	
		def self.track(file, bodies)
			bodies.each do |body|
				file.print("#{body.x}\t#{body.y}\t")
			end
			file.puts()
		end
	end
end