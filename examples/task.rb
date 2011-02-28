$LOAD_PATH << File.join(File.dirname(__FILE__), '../lib/')
require 'rubygems'
require 'asterism'

include Asterism

t= task do
  puts 'another thread'
  42
end

t.run
puts t.get