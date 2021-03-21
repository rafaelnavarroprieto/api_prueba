# Primer script
def suma_factorial(factor=10)
    if factor == 0
        puts @value
    else
        @value ||= 0
        (1..factor).each do |x|
            @value +=  x
        end
        suma_factorial(factor - 1)
    end
end

#Segundo script
def ejercicio2(div=3)
array =  ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h','i']
div = div

parent_array = []
    quotient = array.size / div
    rest = array.size % div
    
    if rest != 0
     quotient += 1    
    end

    div.times do 
        parent_array << Array.new(quotient)
    end
    
    count = 0
    for column in 0...quotient
        for row in 0...div

            parent_array[row][column] = array[count]
            count = count + 1
        end   
    end
    p parent_array
    
end