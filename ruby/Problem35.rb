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
    $primeCache = Hash.new
    $circularCache = Hash.new
    
    def run(n)
        count = 0
        (2...n).each do |i|
            if (circular?(i.to_s))
                puts "#{i}"
                count += 1
            end
        end
        
        puts count
    end

    def circular?(n)
        if (!$circularCache.key?(n))
            rotation = n
            circular = true
            while (true)
                if (!prime?(rotation.to_i))
                    circular = false
                    break
                end

                rotation = rotate(rotation)
                if (rotation.eql?(n))
                    break
                end
            end
            
            $circularCache[n] = circular
        end
        
        $circularCache[n]
    end

    def rotate(str)
        if (str.length < 2)
            return str
        end
        
        numStr = str.to_s
        numStr[1, numStr.length - 1] << numStr[0]
    end

    def prime?(n)
        if (!$primeCache.key?(n))
            $primeCache[n] = $nUtil.isPrime(n)
        end
        
        $primeCache[n]
    end

    Problem35.new.run(1000000)

end

