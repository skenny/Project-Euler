#!/usr/bin/env ruby

=begin

    Let d(n) be defined as the sum of proper divisors of 
    n (numbers less than n which divide evenly into n).
    If d(a) = b and d(b) = a, where a != b, then a and b are an amicable 
    pair and each of a and b are called amicable numbers.

    For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
    therefore d(220) = 284. 

    The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

    Evaluate the sum of all the amicable numbers under 10000.

=end

require './NumberUtils.rb'

class Problem21

    def run(max)
        properDivisorSums = buildCache(max)
        
        sum = 0
        (4...max).step(2) do |x|
            (2...x).step(2) do |y|
                if properDivisorSums[x] == y and properDivisorSums[y] == x and x != y
                    puts "amicable pair #{x},#{y}"
                    sum += x + y
                end
            end
        end
        
        puts sum
    end

    def d(n)
        sum = 0
        NumberUtils.new.properDivisors(n).each do |x|
            sum += x
        end
        
        sum
    end

    def buildCache(max)
        cache = Hash.new
        (2...max).step(2) do |x|
            dX = d(x)
            if dX > 1
                cache[x] = dX
            end
        end
        
        cache
    end

if __FILE__ == $0
    Problem21.new.run(10000)
end
    
end
