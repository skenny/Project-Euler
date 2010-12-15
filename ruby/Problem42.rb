#!/usr/bin/env ruby

=begin

The nth term of the sequence of triangle numbers is given by, tn = 0.5*n*(n+1); so 
the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its alphabetical 
position and adding these values we form a word value. For example, the word value 
for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then 
we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file 
containing nearly two-thousand common English words, how many are triangle words?

=end

class Problem42

    $letters = "abcdefghijklmnopqrstuvwxyz"

    def run
        triangles = Array.new
        (1..20).each do |n|
            triangles << triangle(n)
        end
        
        count = 0
        readWordsFile.each do |word|
            wordValue = wordValue(word)
            #puts "#{word} = #{wordValue}"
            if triangles.include?(wordValue)
                count = count + 1
            end
        end
        
        puts count
    end

    def readWordsFile
        wordsStr = File.open("../data/problem-42-words.txt").gets
        
        words = Array.new
        wordsStr.split(",").each do |word|
            words.push(word.gsub(/\"/, "").downcase)
        end
        
        words
    end

    def wordValue(word)
        word.each_char.inject(0) { |sum, c| sum + $letters.index(c) + 1 }
    end

    def triangle(n)
        return (0.5*n*(n+1)).to_i
    end

    #puts Problem42.new.wordValue("sky")
    #puts Problem42.new.triangle(10)
    puts Problem42.new.run

end

