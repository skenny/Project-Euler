#!/usr/bin/env ruby

=begin

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral 
is formed as follows:

    21  22  23  24  25
    20   7   8   9  10
    19   6   1   2  11
    18   5   4   3  12
    17  16  15  14  13
    
It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

=end

class Problem28

    def run(size)
        if (size % 2 == 0)
            puts "size must be odd"
            return
        end
        
        spiral = build_spiral(size)
        puts diagonal_sum(spiral)
    end

    def diagonal_sum(spiral)
        sum = 1     # we'll skip the middle when we count
        
        size = spiral.size
        l = 0
        r = size - 1
        (0..size - 1).each do |y|
            if (l != r)
                sum += spiral[l][y] + spiral[r][y]
            end
            
            l += 1
            r -= 1
        end
        
        sum
    end
    
    def build_spiral(size)
        arr = Array.new(size).map! { Array.new(size) }
        
        x = size / 2  # don't add 1, since the array index is 0-based
        y = x
        
        dir = 'r'
        count = 1
        dirCount = 0
        (1..size*size).each do |i|
            arr[x][y] = i
            dirCount += 1

            if (dir == 'r')
                x += 1
                if (dirCount == count)
                    dirCount = 0
                    dir = 'd'
                end
            elsif (dir == 'd')
                y += 1
                if (dirCount == count)
                    dirCount = 0
                    count += 1
                    dir = 'l'
                end
            elsif (dir == 'l')
                x -= 1
                if (dirCount == count)
                    dirCount = 0
                    dir = 'u'
                end
            elsif (dir == 'u')
                y -= 1
                if (dirCount == count)
                    dirCount = 0
                    count += 1
                    dir = 'r'
                end
            end
        end
        
        arr
    end

    #Problem28.new.run(5)
    Problem28.new.run(1001)

end
