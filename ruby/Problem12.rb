#!/usr/env/ruby

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
        minNumDivisors = 0
        (1..num).each do |i|
            if num % i == 0
                minNumDivisors += 1
            end
        end

        return minNumDivisors
    end

    if __FILE__ == $0
        #Problem12.new.run(5)    # 28
        Problem12.new.run(500)
    end

end

