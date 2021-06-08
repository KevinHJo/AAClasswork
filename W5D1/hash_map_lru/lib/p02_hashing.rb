# class Integer
#   # Integer#hash already implemented for you
# end

# class Array
#   def hash
#     num = ''
#     self.each_with_index do |ele, idx|
#       num += idx.to_s(2) + ele.to_s(2)
#     end
#     num.to_i
#   end
# end

# class String
#   def hash
#     alpha = ('a'..'z').to_a
#     final = ''
#     self.each_char do |char|
#       index = alpha.index(char.downcase)
#       final += index.to_s(2)
#     end

#     final.to_i
#   end
# end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     alpha = ('a'..'z').to_a
#     final = ''

#     sorted = self.sort_by { |k,v| v }

#     sorted.each do |k,v|
#       idx = alpha.index(k.to_s.downcase)
#       final += idx.to_s(2)
#       if !v.is_a?(Integer)
#         final += v.hash.to_s
#       else
#         final += v.to_s(2)
#       end
#     end

#     final.to_i
#   end
# end
