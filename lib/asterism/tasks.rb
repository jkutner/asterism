# This file is part of the Asterism project.
#
# This application is free software; you can redistribute it and/or
# modify it under the terms of the GNU license defined in the
# LICENSE.txt file.
#
# Copyright (c) 2011 Joe Kutner. All rights reserved.
#
# * Authors:  Joe Kutner

require 'java'

module Asterism
  java_import 'java.util.concurrent.Callable'

  def async(&block)
    task.run
  end

  def task(&block)
    java.util.concurrent.FutureTask.new(&block)
  end

  def thread_pool(nthreads)
    AsterismThreadPool.new(java.util.concurrent.Executors.newFixedThreadPool(nthreads));
  end

  class AsterismThreadPool
    def initialize(executor_service)
      @executor_service = executor_service
    end

    def invoke_all(tasks)
      callables = tasks.map {|t| AsterismCallable.new(&t)}
      @executor_service.invokeAll(callables)
    end

    def shutdown
      @executor_service.shutdown
    end
  end

  class AsterismCallable
    include Callable

    def initialize(&block)
      @block = block
    end

    def call
      @block.call
    end
  end
end