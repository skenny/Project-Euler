#!/usr/env/ruby

class Problem14

    @@numChainHash = Hash.new
    
    def run()
        maxChain = 0
        maxChainStartingNum = 0
        (1...1000000).each do |i|
            sequence = process(i, Array.new)
            #puts "#{i}: #{sequence.length}"
            if (sequence.length > maxChain)
                maxChain = sequence.length
                maxChainStartingNum = i
            end
        end
        
        puts "#{maxChainStartingNum}: #{maxChain}"
    end

    def process(num, sequence)
        sequence.push(num)
        
        if (num == 1)
            return sequence
        end
        
        if (num % 2 == 0)
            return process(num / 2, sequence)
        end
        
        return process(3 * num + 1, sequence)
    end

    if __FILE__ == $0
        Problem14.new.run
    end

end
