module Asterism
  def self.atomically(&block)
    akka.stm.Atomic.new(&block).execute
  end
  
  class Atomic < Java::Akka::Stm::Atomic
    @block
    
    def initialize(&block)
      @block = block
    end
    
    def atomically
      @block.call
    end
  end
end

