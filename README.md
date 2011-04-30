Asterism :: JRuby Concurrency with Akka
=======================================

Description
-----------
Asterism provides a Ruby friendly wrapper for the Akka library.  Thus, it only runs on the
Java Virtual Machine using JRuby.

[Akka Homepage](http://akka.io/)

Examples
---------
Software Transactional Memory

    r = ref(1)
    atomically do
        r.alter {|val| val + 1 }
    end

Asynchronous Tasks

    t = task do
        puts 'Look ma, another thread'
        42
    end
    t.run
    t.get    #=> 42

Setup
-----
The setup for Asterism is a little difficult. This is because it requires many Java artifacts, which
must be installed using bleeding-edge tools.  This will hopefully improve.

First, you must [download and install Maven 3](http://maven.apache.org/download.html)

Then install the gemify-maven-plugin:

    git clone git://github.com/mkristian/jruby-maven-plugins.git
    cd jruby-maven-plugins
    mvn install

With the plugin installed, you can now "gemify" the Akka libraries (note that I'm using version 
0.27.0-SNAPHOT of the plugin. If version 0.27.0 has been push to 
(repo1)[http://repo1.maven.org/maven2/de/saumya/mojo/gemify-maven-plugin/] then this process will 
be less painful - but these steps won't be quite right for the time being):

    mvn de.saumya.mojo:gemify-maven-plugin:0.27.0-SNAPSHOT:gemify -Dgemify.gemname=mvn:se.scalablesolutions.akka:akka-stm -Dgemify.repositories=http://akka.io/repository -Dgemify.version=1.0.0

This will get all the necessary dependencies for building and running Asterism, and turn them into gems.
The gems will be put in the `target` directory.  So now run:

    gem install target/*.gem
    
You can expect some errors, because many of these gems depend on each other - and the `gem` is installing them
in no particular order.  Just install the ones it missed manually.

Next, you need to get my [patched version of Bundler](http://jpkutner.blogspot.com/2011/04/ease-of-bundler-power-of-maven.html) and install it:

    git clone git://github.com/jkutner/bundler.git
    cd bundler
    git checkout master
    rake install

Now, clone the Asterism project and run Bundler with the --local option (so that it gets the gems from
your GEM_HOME instead of from http://akka.io/repository/):

    git clone git://github.com/jkutner/asterism.git 
    cd asterism
    bundle install --local

Finally, build the Asterism gem and install it:

    rake gem
    gem install pkg/asterism-0.1.gem

TODO
-----

+ Configure the log level of logback - its noisey at DEBUG
+ Make Actors easier to use

Version
-------
0.1

Release Notes
-------------
