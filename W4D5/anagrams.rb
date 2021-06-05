def first_anagram?(str1, str2)
    return false if str1.length != str2.length
    anagrams = []
    

    until anagrams.length == str1.length ** str1.length
        count = Hash.new(0)
        str1.each_char { |char| count[char] += 1 }
        subword = ""
        until count.values.all? { |val| val == 0 }
            avaliable = count.select { |k, v| v != 0 }
            current_char = avaliable.keys.shuffle[0]
            subword += current_char
            count[current_char] -= 1
        end
        anagrams << subword
    end

    anagrams.include?(str2)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    chars1 = str1.split('')
    chars2 = str2.split('')

    chars1.each_with_index do |ele1, i1|
        if chars2.include?(ele1)
            chars2.delete_at(chars2.index(ele1))
        end
    end

    if chars2.empty?
        return true 
    else
        return false
    end
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2)
    chars1 = str1.split('')
    chars2 = str2.split('')

    chars1.sort == chars2.sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2)
    hash1 = Hash.new(0)
    # hash2 = Hash.new(0)
    str1.each_char { |char| hash1[char] += 1 }
    str2.each_char { |char| hash1[char] -= 1 }
    hash1.all? { |k, v| v == 0 }

end
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("hello", "heppo")