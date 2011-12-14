Conway
======

A simple CoffeeScript implementation of Conway's Game of Life.

Building
--------

    ./configure
    cake spec
    cake build # Generates JavaScript for use with index.html

Rather than using the globally installed `cake` or `coffee`, you may wish to use `node_modules/.bin/*`.

Or, if that wears out your fingers, add it to your path:

    PATH="node_modules/.bin:$PATH"

Running
-------

    coffee bin/conway.coffee

Contributing
------------

Running tests:

    cake spec

Running tests automatically:

    bundle exec guard

License
-------

GPLv2.  See LICENSE for a copy.
