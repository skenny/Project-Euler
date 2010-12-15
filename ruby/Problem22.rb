#!/usr/bin/env ruby

=begin

Using names.txt (right click and 'Save Link/Target As...'), a 46K text file 
containing over five-thousand first names, begin by sorting it into 
alphabetical order. Then working out the alphabetical value for each name, 
multiply this value by its alphabetical position in the list to obtain a 
name score.

For example, when the list is sorted into alphabetical order, COLIN, which 
is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, 
COLIN would obtain a score of 938  53 = 49714.

What is the total of all the name scores in the file?

=end

class Problem22

    @@letters = "abcdefghijklmnopqrstuvwxyz";

    def run
        nameStr = File.open("../data/problem-22-names.txt").gets
        
        names = Array.new
        nameStr.split(",").each do |name|
            names.push(name.gsub(/\"/, "").downcase)
        end
        
        count = 1
        points = 0
        names.sort.each do |name|
            namePoints = sum(name) * count
            count += 1
            #puts "#{name} = #{namePoints}"
            points += namePoints
        end
        
        puts points
    end
    
    def sum(name)
        points = 0
        name.each_char.each do |c|
            points += @@letters.index(c) + 1
        end
        
        points
    end

    #puts Problem22.new.sum("colin")
    Problem22.new.run

end
