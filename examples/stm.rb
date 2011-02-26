$LOAD_PATH << File.join(File.dirname(__FILE__), '../lib/')
require 'rubygems'
require 'asterism'

include Asterism

def counter(ref)
  atomically do
    ref.mod {|val| val + 1 }
  end
end

r = ref(1)
puts counter(r)
puts counter(r)