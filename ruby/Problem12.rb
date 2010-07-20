#!/usr/env/ruby

require 'NumberUtils'

class Problem12

    def run(minNumDivisors)
        triNum = 0
        count = 1
        while (true) do
            triNum += count
            count += 1

            numDivisors = countDivisors(triNum)
            puts "#{triNum} has #{numDivisors} divisor(s)"
            break if numDivisors > minNumDivisors
        end
    end

    def countDivisors(num)
        numDivisors = 1
        
        primeFactors = NumberUtils.new.primeFactorsWithCount(num)
        primeFactors.each do |factor, count|
            numDivisors = numDivisors * (count + 1)
        end
        
        return numDivisors
    end

    if __FILE__ == $0
        #Problem12.new.run(5)    # 28
        Problem12.new.run(500)
    end

end

