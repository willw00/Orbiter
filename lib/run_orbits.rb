require_relative 'helper'

	body_a = Free_body.new(x: 100, vel_y: -10)
	body_b = Free_body.new(mass: 5000)
	body_c = Free_body.new(y: 50, vel_y: 15, vel_x: -10)
	body_d = Free_body.new(mass: 300, y: -60, x: -50, vel_y: 13)
	all_bodies = [body_a, body_b, body_c, body_d]

	tracker = File.open('move_tracker.txt', 'w')
	5000.times do 
		all_bodies.each do |body|
			Orbiter.calc_grav_acc(body, all_bodies)
			Orbiter.update_position(body)
			Orbiter.calc_grav_acc(body, all_bodies)
			Orbiter.update_velocity(body)
		end
		Orbiter.track(tracker, all_bodies)
	end
	tracker.close

	puts "Thanks for running!"