#!/usr/env/ruby

class Problem20

    def run(n)
        factorial = (1..n).inject(1) { |product, n| product * n }
        
        sum = 0
        factorial.to_s.each_char do |d|
            sum = sum + d.to_i
        end
        
        puts sum
    end

    if __FILE__ == $0
        Problem20.new.run(100)
    end

end
