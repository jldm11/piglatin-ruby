require './piglatinClass'

print "Please write a phrase to translate:"
phrase = gets.chomp

piglatin = Piglatin.new phrase

puts "Here is your phrase in piglatin language:"
puts piglatin.translate