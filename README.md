Asterism :: JRuby Concurrency with Akka
=======================================

Description
-----------
Asterism provides a Ruby friendly wrapper for the Akka library.  Thus, it only runs on the
Java Virtual Machine using JRuby.

[Akka Homepage](http://akka.io/)

NOTE: things aren't working quite right yet.

Example
-------
Software Transactional Memory

    r = ref(1)
    atomically do
        r.mod {|val| val + 1 }
    end

Asynchronous Tasks

    async do
        puts 'Look ma, another thread
    end

Setup
-----
The setup for Asterism is a little difficult. This is because it requires many Java artifacts, which
must be installed using bleeding-edge tools.  This will hopefully improve.

First, run the dependency install task:

    rake deps:install

This will get all the necessary dependencies for building and running Asterism.

Next, build the Asterism gem and install it:

    rake gem
    gem install pkg/asterism-0.1.gem

TODO
-----
+ Switch to gemify-maven-plugin instead of maven_gem
+ Configure the log level of logback - its noisey at DEBUG

Version
-------
0.1

Release Notes
-------------
