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
#require 'multiverse-core'
#require 'args4j'
#require 'asm'
#require 'asm-tree'
#require 'asm-analysis'
#require 'asm-commons'
#require 'asm-util'
#require 'multiverse-instrumentation'
#require 'gson'
#require 'google-collections'
#require 'multiverse-benchy'
#require 'asm-all'
#require 'multiverse-alpha-unborn'
require 'multiverse-alpha'
require 'hawtdispatch'
require 'hawtdispatch-scala'
require 'jsr166x'
require 'logback-core'
require 'slf4j-api'
require 'logback-classic'
require 'configgy'
require 'scala-library'
require 'uuid'
require 'akka-actor'
require 'akka-stm'

module Asterism

  java_import 'akka.stm.Atomic'
  java_import 'akka.stm.Ref'
  java_import 'akka.stm.TransactionFactoryBuilder'

  def ref(x)
    Ref.new(x)
  end

  def atomically(&block)
    tx = TransactionFactoryBuilder.new.setReadonly(false).build
    AsterismAtomic.new(tx).set_proc(&block).execute
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

