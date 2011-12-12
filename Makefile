compile:
	mkdir -p build
	node_modules/.bin/coffee --print --join lib/*.coffee > build/conway.js

test:
	node_modules/.bin/jasmine-node --coffee spec/
