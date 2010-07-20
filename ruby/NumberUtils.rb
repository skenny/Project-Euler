#!/usr/env/ruby

require 'mathn'

class NumberUtils

    def isPrime(num)
        if (num < 2)
            return false
        elsif (num == 2)
            return true
        end
            
        if (num % 2 == 0)
            return false
        end
        
        (3..Math.sqrt(num)).step 2 do |i|
            if (num % i == 0)
                return false
            end
        end
        
        return true
    end

    def primeFactors(num)
        primeFactors = Array.new
                
        (2..Math.sqrt(num)).each do |i|
            if (num % i == 0)
                primeFactors.push(i)
                num = num / i while num % i == 0
            end
        end
        
        primeFactors.push(num) unless num < 2
        
        return primeFactors
    end

    if __FILE__ == $0
        nu = NumberUtils.new
        
        puts "1: #{nu.isPrime(1)}"
        puts "2: #{nu.isPrime(2)}"
        puts "7: #{nu.isPrime(7)}"
        puts "8: #{nu.isPrime(8)}"
        puts "53: #{nu.isPrime(53)}"
        
        puts "741273: #{nu.primeFactors(741273)}"
    end

end

