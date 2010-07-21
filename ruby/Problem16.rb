#!/usr/env/ruby

class Problem16

    def run(exponent)
        #sum = 0
        #(2**exponent).to_s.each_char do |c|
        #    sum += c.to_i
        #end
        sum = (2**exponent).to_s.each_char.inject(0) { |sum, c| sum + c.to_i }
        puts sum
    end

    if __FILE__ == $0
        #Problem16.new.run(15)
        Problem16.new.run(1000)
    end
end
