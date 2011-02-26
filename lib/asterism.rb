require 'rubygems'
require 'java'
require 'multiverse-core'
require 'multiverse-instrumentation'
require 'multiverse-alpha-unborn'
require 'multiverse-alpha'
require 'multiverse-benchy'
require 'configgy'
require 'slf4j-api'
require 'scala-library'
require 'akka-actor'
require 'akka-stm'

java_import 'akka.stm.Atomic'

class Foo < Atomic
  def atomically
    puts 'foo'
  end
end

Foo.new.execute