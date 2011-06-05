#!/usr/env/ruby

=begin

Find the number of integers 1  n  107, for which n and n + 1 have the same number 
of positive divisors. 

For example, 14 has the positive divisors 1, 2, 7, 14 while 15 has 1, 3, 5, 15.

=end

require "./NumberUtils.rb"

class Problem179

    $nu = NumberUtils.new
    $cache = Hash.new

    def run
        puts "starting... " 
        count = 0
        (1..10000000).each do |i|
            if (i % 20000 == 0)
                puts "...#{i}..."
            end
            if (pd(i) == pd(i + 1))
                count += 1
                puts i
            end
        end
        
        puts "done - found #{count}"
    end
    
    def pd(num)
        pd = $cache[num]
        if (!pd.nil?)
            #puts "cached #{num} = #{pd}"
            pd
        end
        
        puts "calc #{num}"
        
        pd = $nu.positiveDivisors(num)
        $cache[num] = pd
        pd
    end
    
    #puts NumberUtils.new.positiveDivisors(14)
    #puts NumberUtils.new.positiveDivisors(15)

    Problem179.new.run

end

