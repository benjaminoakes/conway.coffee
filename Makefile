compile:
	mkdir -p build
	cat lib/* > build/conway.coffee
	# node_modules/.bin/coffee --print --join lib/*.coffee > build/conway.js
	# node_modules/.bin/coffee --output build --compile --join lib/*.coffee
	node_modules/.bin/coffee --output build --compile build/conway.coffee

test:
	node_modules/.bin/jasmine-node --coffee spec/
