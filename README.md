[![Gem Version](https://badge.fury.io/rb/orbiter.png)](http://badge.fury.io/rb/orbiter)

Orbiter
=======
This program calculates orbital effects for a system with an arbitrary number of bodies.  

Installation
------------
```
gem install orbiter
```

Setup
-----
In your program, create as many bodies as you want with: 

```ruby
Orbiter::Free_body.new({:mass, :x, :y, :vel_x, :vel_y, :acc_x, :acc_y})
```   
All of the body parameters have defaults, but you should give initial positions and velocities to make it interesting.  Place all bodies into an array to run.   

Running Simulation
------------------
To run the orbits, call:

```ruby
Orbiter::Orbit_runner.run({:output_file, :bodies_array})
```   
You can specify a file to which to print all of the body coordinates, otherwise they will be printed to console.  Each line is a tab separated list of x and y coordinates for each body (i.e. 'body1.x\tbody1.y\tbody2.x\tbody2.y...\n').  You can easily plot the data with gnuplot, for instance, assuming the output file was called 'move_tracker.txt':  

```
plot 'move_tracker.txt' using 1:2 wi li, 'move_tracker.txt' using 3:4 wi li...
```   
for all bodies.  


Things to address in later versions:  
-Make gravitational and time constants adjustable  
-Make number of time-steps adjustable  
-Work on creating a GUI  
-Add 3D functionality?
