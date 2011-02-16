#!/usr/bin/env ruby

=begin

    The number, 197, is called a circular prime because all rotations of the digits: 
        197, 971, and 719
    are themselves prime.

    There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 
    and 97.

    How many circular primes are there below one million?

=end

require "./NumberUtils"

class Problem35

    $nUtil = NumberUtils.new
    
    def run(n)
        count = 0
        (2...n).each do |i|
            if (circular?(i))
                puts "#{i}"
                count += 1
            end
        end
        
        puts count
    end
    
    def circular?(num)
        if (!$nUtil.isPrime(num))
            return false
        end
        
        circular = true
        nRot = num.to_s
        while (true)
            nRot = rotate(nRot)
            if (nRot == num.to_s)
                break
            end
            if (!$nUtil.isPrime(nRot.to_i))
                circular = false
            end
        end
        
        circular
    end

    def rotate(str)
        if (str.length < 2)
            return str
        end
        
        numStr = str.to_s
        numStr[1, numStr.length - 1] << numStr[0]
    end

    Problem35.new.run(1000000)

end

