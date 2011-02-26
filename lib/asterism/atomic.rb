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
    Ref.new(x)
  end

  def atomically(&block)
    AsterismAtomic.new.set_proc(&block).execute
  end

  class AsterismAtomic < Atomic
    def set_proc(&block)
      @block = block
      self
    end

    def atomically
      @block.call
    end
  end
end

