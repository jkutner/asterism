require 'java'

module Asterism
  def self.run(&block)
    java.util.concurrent.FutureTask.new(&block).run
  end
end