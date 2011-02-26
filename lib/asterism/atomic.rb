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
require 'multiverse-core'
require 'multiverse-instrumentation'
require 'multiverse-alpha-unborn'
require 'multiverse-alpha'
require 'multiverse-benchy'
require 'configgy'
require 'slf4j-api'
require 'scala-library'
require 'uuid'
require 'akka-actor'
require 'akka-stm'

module Asterism

  java_import 'akka.stm.Atomic'

  java_import 'akka.stm.Ref'

  def ref(x)
    return AsterismRef.new(x)
  end

  def atomically(&block)
    AsterismAtomic.new(&block).execute
  end

  class AsterismRef < Ref
    def mod
      old_val = self.get
      new_val = yield(old_val)
      self.set(new_val)
    end
  end

  
  class AsterismAtomic < Atomic
    @block
    
    def initialize(&block)
      @block = block
    end
    
    def atomically
      @block.call
    end
  end
end

