require 'java'

module Asterism
  def do_async(&block)
    java.util.concurrent.FutureTask.new(&block).run
  end
end