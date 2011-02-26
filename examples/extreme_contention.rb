$LOAD_PATH << File.join(File.dirname(__FILE__), '../lib/')
require 'rubygems'
require 'asterism'

include Asterism

def test_stm(nitems, nthreads, niters)

  refs = (1..nitems).map {ref(0)}

  pool = thread_pool(nthreads)

  tasks = (0..(nthreads-1)).map { |t|
    proc {
      (1..niters).each do
        atomically do
          refs.each do |r|
            r.alter {|val| val + 1 + t}
          end
        end
      end
    }
  }

  pool.invoke_all(tasks).each {|f| f.get}

  pool.shutdown

  refs
end

puts test_stm(10,10,10000).map(&:get).join(',')