#!/usr/env/ruby

class Problem14

    @@cache = Hash.new

    def run()
        maxChain = 0
        maxChainStartingNum = 0
        (1...1000000).each do |i|
            #sequence = getSequence(i, Array.new)
            #len = sequence.length
            len = getCount(i)
            if (len > maxChain)
                maxChain = len
                maxChainStartingNum = i
            end
        end
        
        puts "#{maxChainStartingNum}: #{maxChain}"
    end

    def getSequence(num, sequence)
        sequence.push(num)
        
        if (num == 1)
            return sequence
        end
        
        if (num % 2 == 0)
            return getSequence(num / 2, sequence)
        end
        
        return getSequence(3 * num + 1, sequence)
    end

    def getCount(num)
        count = @@cache[num]
        if (!count.nil?)
            return count
        end
        
        count = 1
        if (num > 1)
            if (num % 2 == 0)
                count = count + getCount(num / 2)
            else
                count = count + getCount(3 * num + 1)
            end
        end
        
        @@cache[num] = count
        return count
    end

    if __FILE__ == $0
        Problem14.new.run
    end

end
