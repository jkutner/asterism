# This file is part of the Asterism project.
#
# This application is free software; you can redistribute it and/or
# modify it under the terms of the GNU license defined in the
# LICENSE.txt file.
#
# Copyright (c) 2011 Joe Kutner. All rights reserved.
#
# * Authors:  Joe Kutner

require 'rubygems'

require 'rake'
require 'rake/clean'
require 'rake/packagetask'

require 'spec/rake/spectask'


namespace :deps do

  task :install => [:install_maven_gem, :install_jars]

  task :install_maven_gem do
    begin
      require 'fileutils'
      FileUtils.mkdir 'tmp'
      exec "cd tmp; git clone git://github.com/jkutner/maven_gem.git; cd maven_gem; rake install"
    ensure
      FileUtils.rm_rf 'tmp'
    end
  end

  task :install_jars do
    require 'maven_gem'

    # TODO
    # being
    #   require 'junit.junit'
    # rescue
    #   MavenGem.intall
    # end

    MavenGem.install(
        "org.multiverse",
        "multiverse-core",
        "0.6.1",
        "http://repo1.maven.org/maven2/"
    )
    MavenGem.install(
        "junit",
        "junit",
        "3.8.1",
        "http://download.java.net/maven/2"
    )
    MavenGem.install(
        "args4j",
        "args4j",
        "2.0.16",
        "http://download.java.net/maven/2"
    )
    MavenGem.install(
        "asm",
        "asm",
        "3.2",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "asm",
        "asm-tree",
        "3.2",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "asm",
        "asm-analysis",
        "3.2",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "asm",
        "asm-commons",
        "3.2",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "asm",
        "asm-util",
        "3.2",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "org.multiverse",
        "multiverse-instrumentation",
        "0.6.1",
        "http://repo1.maven.org/maven2",
        {'asm.version' => '3.2'}
    )
    MavenGem.install(
        "com.google.code.gson",
        "gson",
        "1.4",
        "http://repo2.maven.org/maven2"
    )
    MavenGem.install(
        "com.google.collections",
        "google-collections",
        "1.0",
        "http://repo2.maven.org/maven2"
    )
    MavenGem.install(
        "org.multiverse",
        "multiverse-benchy",
        "0.6.1",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "asm",
        "asm-all",
        "3.2",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "org.multiverse",
        "multiverse-alpha-unborn",
        "0.6.1",
        "http://repo1.maven.org/maven2",
        {'asm.version' => '3.2'}
)
    MavenGem.install(
        "org.multiverse",
        "multiverse-alpha",
        "0.6.1",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "org.fusesource.hawtdispatch",
        "hawtdispatch",
        "1.0",
        "http://repo1.maven.org/maven2/"
    )
    MavenGem.install(
        "org.fusesource.hawtdispatch",
        "hawtdispatch-scala",
        "1.0",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "jsr166x",
        "jsr166x",
        "1.0",
        "http://www.scalablesolutions.se/akka/repository"
    )
    MavenGem.install(
        "ch.qos.logback",
        "logback-core",
        "0.9.24",
        "http://repo1.maven.org/maven2",
        {'parent.version' => '0.9.24'}
    )
    MavenGem.install(
        "org.slf4j",
        "slf4j-api",
        "1.6.0",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "ch.qos.logback",
        "logback-classic",
        "0.9.24",
        "http://repo1.maven.org/maven2"
    )
    MavenGem.install(
        "org.scala-lang",
        "scala-library",
        "2.8.1",
        "http://scala-tools.org/repo-releases"
    )
    MavenGem.install(
        "net.lag",
        "configgy",
        "2.0.2-nologgy",
        "http://www.scalablesolutions.se/akka/repository")
    MavenGem.install(
        "com.eaio",
        "uuid",
        "3.2",
        "http://www.scalablesolutions.se/akka/repository")
    MavenGem.install(
        "se.scalablesolutions.akka",
        "akka-actor",
        "1.0-RC3",
        "http://www.scalablesolutions.se/akka/repository"
    )
    MavenGem.install(
        "se.scalablesolutions.akka",
        "akka-stm",
        "1.0-RC3",
        "http://www.scalablesolutions.se/akka/repository"
    )
  end
end