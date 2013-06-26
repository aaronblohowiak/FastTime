// Include the Ruby headers and goodies
#include "ruby.h"
#include "time.h"

VALUE FastTime = Qnil;

void Init_fasttime();
VALUE method_gettimeofday(VALUE self);

void Init_fasttime() {
	FastTime = rb_define_module("FastTime");
	rb_define_method(FastTime, "gettimeofday", method_gettimeofday, 0);	
}

VALUE method_gettimeofday(VALUE self) {
	struct timeval now;
	gettimeofday(&now, NULL);
	return LONG2FIX((long int)now.tv_sec);
}
