#!/usr/bin/env ruby

=begin

A perfect number is a number for which the sum of its proper divisors is 
exactly equal to the number. For example, the sum of the proper divisors 
of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect 
number.

A number n is called deficient if the sum of its proper divisors is less 
than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the 
smallest number that can be written as the sum of two abundant numbers is 
24. By mathematical analysis, it can be shown that all integers greater 
than 28123 can be written as the sum of two abundant numbers. However, 
this upper limit cannot be reduced any further by analysis even though 
it is known that the greatest number that cannot be expressed as the 
sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the 
sum of two abundant numbers.

=end

require "./NumberUtils.rb"

class Problem22

    def run
        numUtils = NumberUtils.new
        
        puts "calculating abundants"
        abundants = Array.new
        (1..28123).each do |n|
            if numUtils.abundant(n)
                puts n
		abundants << n
            end
        end
        
        puts "determining qualifying ints"
        ints = Array.new
        (1..28123).each do |n|
            includeN = true

            abundants.each do |a1|
                if a1 < n
                    abundants.each do |a2|
                        sum = a1 + a2

                        if sum > n
                            break
                        end

                        if sum == n
                            includeN = false
                            break
                        end
                    end

                    if !includeN
                        break
                    end
                end
            end

            if includeN
                puts n
                ints << n
            end
        end

        puts ints.inject(0) { |sum, i| sum + i }
    end

    Problem22.new.run

end
