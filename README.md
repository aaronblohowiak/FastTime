Ever hit performance bottlenecks with Time.now?  Willing to deal with the fuzziness of `gettimeofday`?  Well then this gem is for you!

## FastTime is a stupid-simple binding to POSIX `gettimeofday`

Very useful if what you want to do is compare times for things like cache invalidation where you don't mind a little jitter than gettimeofday can introduce.

		1.9.3p374 :007 > puts Time.now.to_i.to_s + " " + gettimeofday.to_s
		1372267854 1372267854
		1.9.3p374 :008 > puts Benchmark.measure{for i in 1..1_000_000; Time.now < Time.now; end }
		  1.030000   0.040000   1.070000 (  1.073589)
		1.9.3p374 :009 > puts Benchmark.measure{for i in 1..1_000_000; gettimeofday < gettimeofday; end }
		  0.160000   0.000000   0.160000 (  0.168349)

Seconds since epoch in ruby never happened so fast!

		1.9.3p374 :001 > require 'fasttime'
		1.9.3p374 :002 > require 'benchmark'
		1.9.3p374 :003 > include FastTime
		1.9.3p374 :004 > puts Benchmark.measure{for i in 1..1_000_000; Time.now.to_i; end }
		  0.700000   0.000000   0.700000 (  0.704198)
		1.9.3p374 :005 > puts Benchmark.measure{for i in 1..1_000_000; gettimeofday; end }
		  0.100000   0.000000   0.100000 (  0.100086)
		1.9.3p374 :006 > puts Benchmark.measure{for i in 1..1_000_000; nil; end }
		  0.050000   0.000000   0.050000 (  0.051070)

For more info see: http://linux.die.net/man/2/gettimeofday

Impl notes: time_t is cast to a (long int) in case it isnt already, so YMMV on speed if you are running a 32 bit ruby and Fixnum has to be promoted to a Bignum to store the long int.



Alternatives
===

When I wrote this library, I was unaware of any alternatives.  Since that time, I have found one that uses the monotonic clock instead of `gettimeofday`: https://github.com/bwbuchanan/absolute_time
