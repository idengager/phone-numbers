MAPPINGS = [
  nil,
  nil,
  %w(A B C),
  %w(D E F),
  %w(G H I),
  %w(J K L),
  %w(M N O),
  %w(P Q R S),
  %w(T U V),
  %w(W X Y Z)
]

dictionary = {}

for i in (1..10)
  dictionary[i] = []
end

File.open("./dictionary.txt", "r") do |file|
  file.each_line do |line|
    length = line.strip.length
    if length <= 10
      dictionary[length] << line.strip
    end
  end
end

puts "done"

public

def map_to_letters(number)
  number.to_s.chars.map{ |digit| MAPPINGS[digit.to_i] }
end

keys = map_to_letters(6686787825)
puts keys.inspect

for i in (2..7)
  first_word_mappings = keys[0..i]
  second_word_mappings = keys[(i + 1)..9]

  first_word_combinations = first_word_mappings.shift.product(*first_word_mappings).map(&:join)
  second_word_combinations = second_word_mappings.shift.product(*second_word_mappings).map(&:join)

  puts first_word_mappings.take(10).inspect
  puts second_word_mappings.take(10).inspect
end
