require 'spec_helper'
require_relative '../../lib/orbit_helper'

describe Orbiter::Free_body do 
	it "has default attributes" do 
		free_body = Orbiter::Free_body.new

		expect(free_body.mass).to eq(10)
		expect(free_body.x).to eq(0)
		expect(free_body.y).to eq(0)
		expect(free_body.vel_x).to eq(0)
		expect(free_body.vel_y).to eq(0)
		expect(free_body.acc_x).to eq(0)
		expect(free_body.acc_y).to eq(0)
		expect(free_body.old_acc_x).to eq(0)
		expect(free_body.old_acc_y).to eq(0)
	end

	it "can accept other attributes" do 
		free_body = Orbiter::Free_body.new(mass:15, x: 12, y: 11, vel_x: 23, vel_y: 31, acc_x: 100, acc_y: 1)

		expect(free_body.mass).to eq(15)
		expect(free_body.x).to eq(12)
		expect(free_body.y).to eq(11)
		expect(free_body.vel_x).to eq(23)
		expect(free_body.vel_y).to eq(31)
		expect(free_body.acc_x).to eq(100)
		expect(free_body.acc_y).to eq(1)
		expect(free_body.old_acc_x).to eq(0)
		expect(free_body.old_acc_y).to eq(0)
	end
end