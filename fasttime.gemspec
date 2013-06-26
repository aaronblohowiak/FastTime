Gem::Specification.new do |s|
  s.name        = 'fasttime'
  s.version     = '0.0.1'
  s.date        = '2013-06-25'
  s.summary     = "Fast bindings to gettimeofday"
  s.description = "Very fast bindings to the current time in seconds since epoch."
  s.authors     = ["Aaron Blohowiak"]
  s.email       = 'aaron.blohowiak@gmail.com'
  s.files       = Dir.glob('lib/**/*.rb') + Dir.glob('ext/**/*.{c,h,rb}')
  s.extensions = ['ext/fasttime/extconf.rb']
  s.homepage    = 'http://github.com/aaronblohowiak/FastTime'
end
