# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('lib/run_orbits.rb') {"run_orbits.rb"}
end

guard :shell do 
  watch('lib/run_orbits.rb') {'ruby run_orbits.rb'}
 end