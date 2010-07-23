#!/usr/env/ruby

class Problem17

    $hash = Hash.new

    def run()
        buildHash

        #letters = (1..1000).each.inject(0) { |letters, n| letters + to_w(n).length }
        letters = 0
        (1..1000).each do |n|
            phrase = to_w(n)
            count = phrase.length
            puts "#{n}: #{phrase} (#{count})"
            letters = letters + count
        end        
        puts letters
    end

    def to_w(n)
        phrase = ""
        if (n < 20 or (n < 100 and n % 10 == 0))
            phrase << $hash[n]
        elsif (n >= 20 and n < 100)
            phrase << to_w(n - n % 10) << to_w(n % 10)
        elsif (n == 1000)
            phrase << "onethousand"
        elsif (n % 100 == 0)
            if (n == 100)
                phrase << to_w(1)
            else
                phrase << to_w(n / 100)
            end
            phrase << "hundred"
        elsif (n > 100 and n < 1000)
            phrase << to_w(n / 100) << "hundredand" << to_w(n % 100)
        end

        return phrase;
    end

    def buildHash()
        $hash[1] = "one"
        $hash[2] = "two"
        $hash[3] = "three"
        $hash[4] = "four"
        $hash[5] = "five"
        $hash[6] = "six"
        $hash[7] = "seven"
        $hash[8] = "eight"
        $hash[9] = "nine"
        $hash[10] = "ten"
        $hash[11] = "eleven"
        $hash[12] = "twelve"
        $hash[13] = "thirteen"
        $hash[14] = "fourteen"
        $hash[15] = "fifteen"
        $hash[16] = "sixteen"
        $hash[17] = "seventeen"
        $hash[18] = "eighteen"
        $hash[19] = "nineteen"
        $hash[20] = "twenty"
        $hash[30] = "thirty"
        $hash[40] = "forty"
        $hash[50] = "fifty"
        $hash[60] = "sixty"
        $hash[70] = "seventy"
        $hash[80] = "eighty"
        $hash[90] = "ninety"
    end

    Problem17.new.run()    

end
