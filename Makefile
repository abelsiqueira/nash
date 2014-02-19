
all:
	lime build flash
	cp Export/flash/bin/Nash.swf Nash.swf

run:
	firefox nash.html &
