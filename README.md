Conway
======

A simple CoffeeScript implementation of Conway's Game of Life.

Building
--------

    ./configure
    cake
    cake spec
    coffee bin/conway.coffee

Rather than using the globally installed `cake` or `coffee`, you may wish to use `node_modules/.bin/*`.

Contributing
------------

Running tests:

    cake test

Running tests automatically:

    bundle exec guard

License
-------

GPLv2.  See LICENSE for a copy.
