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

    def primeFactorsWithCount(num)
        primeFactors = Hash.new
        
        (2..Math.sqrt(num)).each do |i|
            factorCount = 0
            while (num % i == 0)
                num = num / i
                factorCount = factorCount + 1
            end
            
            primeFactors.store(i, factorCount) unless factorCount == 0
        end

        primeFactors.store(num, 1) unless num < 2
        
        return primeFactors
    end

    def properDivisors(num)
        properDivisors = [1]
        (2..Math.sqrt(num)).each do |i|
            if num % i == 0
                properDivisors.push(i)
                properDivisors.push(num / i)
            end
        end
        
        properDivisors
    end

    def properFactors(num)
        properFactors = [1]
        (2..Math.sqrt(num)).each do |i|
            if num % i == 0
                properFactors.push(i)
                properFactors.push(num / i) unless i == (num / i)
            end
        end
        
        properFactors
    end

    def positiveDivisors(num)
        positiveDivisors = [1]
        (2..num).each do |i|
            if num % i == 0
                #puts "num #{num} i #{i}"
                positiveDivisors.push(i)
            end
        end
        
        positiveDivisors
    end

    def abundant(num)
        properFactors(num).inject(0) { |sum, divisor| sum + divisor } > num
    end

    def fibonacci(num)
        num < 2 ? num : fibonacci(num - 1) + fibonacci(num - 2)
    end

    if __FILE__ == $0
        nu = NumberUtils.new
        
        puts "1: #{nu.isPrime(1)}"
        puts "2: #{nu.isPrime(2)}"
        puts "7: #{nu.isPrime(7)}"
        puts "8: #{nu.isPrime(8)}"
        puts "53: #{nu.isPrime(53)}"
        
        puts "741273: #{nu.primeFactors(741273)}"
        puts "741273: #{nu.primeFactorsWithCount(741273)}"
        
        puts "14147512341: #{nu.primeFactorsWithCount(14147512341)}"
        
        puts "properDivisors(220): #{nu.properDivisors(220)}"
        puts "properDivisors(284): #{nu.properDivisors(284)}"
        puts "properDivisors(12): #{nu.properDivisors(12)}"
        puts "properDivisors(16): #{nu.properDivisors(16)}"
                
        puts "properFactors(12): #{nu.properFactors(12)}"
        puts "properFactors(16): #{nu.properFactors(16)}"
        
        puts "abundant(12): #{nu.abundant(12)}"
        puts "abundant(16): #{nu.abundant(16)}"
        
        (1..12).each do |i|
            puts "f#{i} = #{nu.fibonacci(i)}"
        end
    end

end

