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

  CONF_DEFAULTS = {
      :read_only => false,
      :speculative => false,
      :track_reads => false,
      :quick_release => false,
      :write_skew => false
  }

  java_import 'akka.stm.Atomic'
  java_import 'akka.stm.Ref'
  java_import 'akka.stm.TransactionFactoryBuilder'
  java_import 'org.multiverse.api.TraceLevel'
  java_import 'akka.util.Duration'

  def ref(x)
    Ref.new(x)
  end

  def atomically(conf={},&block)
    conf = conf.merge(CONF_DEFAULTS)
    tx = TransactionFactoryBuilder.new.
        setReadonly(conf[:read_only]).
        setSpeculative(conf[:speculative]).
        setTrackReads(conf[:track_reads]).
#        setQuickRelease(false).
#        setWriteSkew(false).
#        setTimeout(Duration.new(9,"seconds")).
#        setMaxRetries(99999).
#        setBlockingAllowed(false).
#        setTraceLevel(TraceLevel::None)
        build
    AsterismAtomic.new(tx).set_proc(&block).execute
  end

  class AsterismAtomic < Atomic
    def set_proc(&block)
      @block = block
      self
    end

    def atomically
      begin
        @block.call
      rescue NativeException => e
        if e.cause.java_class.package.name.include? "org.multiverse"
          raise e.cause
        else
          raise e
        end
      end
    end
  end
end

