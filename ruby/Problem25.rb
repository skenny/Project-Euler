#!/usr/bin/env ruby

=begin

    The Fibonacci sequence is defined by the recurrence relation:
        Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.

    Hence the first 12 terms will be:
        F1 = 1
        F2 = 1
        F3 = 2
        F4 = 3
        F5 = 5
        F6 = 8
        F7 = 13
        F8 = 21
        F9 = 34
        F10 = 55
        F11 = 89
        F12 = 144
    
    The 12th term, F12, is the first term to contain three digits.
    What is the first term in the Fibonacci sequence to contain 1000 digits?

=end

require "./NumberUtils"

class Problem25

    @@cache = Hash.new

    def run(digits)
        i = 1
        val = ''
        while val.length < digits
            val = cacheFib(i).to_s
            i += 1
        end
        
        i -= 1
        
        puts "answer: fib(#{i}) = #{val} (length: #{val.length})"
    end
    
    def cacheFib(num)
        if @@cache.key?(num)
            return @@cache[num]
        end
        
        if num < 2
            fib = num == 1 ? 1 : 0
        else
            fib = cacheFib(num - 1) + cacheFib(num - 2)
        end
        
        @@cache[num] = fib
        fib
    end

    #(1..13).each do |i|
    #    puts "fib(#{i}) = #{Problem25.new.cacheFib(i)}"
    #end
    
    #Problem25.new.run(3)
    #Problem25.new.run(12)
    Problem25.new.run(1000)

end

