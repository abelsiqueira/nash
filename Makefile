#BROWSER=chromium
BROWSER=firefox

all:
	lime build flash
	cp Export/flash/bin/Nash.swf Nash.swf

run:
	$(BROWSER) nash.html &

debug:
	lime build flash -debug
	cp Export/flash/bin/Nash.swf Nash.swf
