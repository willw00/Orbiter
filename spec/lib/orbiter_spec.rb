require 'spec_helper'
require_relative '../../lib/helper.rb'


describe Orbiter do
	let(:body_a) {Free_body.new(x: 10)}
	let(:body_b) {Free_body.new(mass:100)}
	let(:body_c) {Free_body.new(mass:1, y: 10)}
	let(:all_bodies) {[body_a, body_b, body_c]}

	it "uses the gravitational constant G" do 
		expect(Orbiter::G_CONSTANT).to eq(1)
	end 

	it "calculates the distance between 2 bodies" do 
		expect(Orbiter.calc_dist(body_a, body_b)).to eq(10)
		expect(Orbiter.calc_dist(body_b, body_c)).to eq(10)
		expect(Orbiter.calc_dist(body_a, body_c)).to eq(Math.sqrt(200))
	end

	it "updates the gravitational acceleration on a single body from all given bodies" do
	 	Orbiter.calc_grav_acc(body_b, all_bodies)

		expect(body_b.acc_x).to eq(0.1)
		expect(body_b.acc_y).to eq(0.01)
	end

	it "updates the velocity of a single body" do 
		Orbiter.calc_grav_acc(body_b, all_bodies)
		Orbiter.update_velocity(body_b)

		expect(body_b.vel_x).to eq(0.05)
		expect(body_b.vel_y).to eq(0.005)
	end

	it "updates the position of a single body" do 
		Orbiter.calc_grav_acc(body_b, all_bodies)
		Orbiter.update_position(body_b)

		expect(body_b.x).to eq(0.05)
		expect(body_b.y).to eq(0.005)
	end
end