Asterism :: JRuby Concurrency with Akka
=======================================

Description
-----------
Asterism provides a Ruby friendly wrapper for the Akka library.  Thus, it only runs on the
Java Virtual Machine using JRuby.

Example
-------
Software Transactional Memory

    r = ref(1)
    atomically do
        ref.mod {|val| val + 1 }
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

Version
-------
0.1

Release Notes
-------------
