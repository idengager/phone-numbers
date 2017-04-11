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

words = []

for i in (2..7)
  first_word_mappings = keys[0..i]
  next if first_word_mappings.size < 3

  second_word_mappings = keys[(i + 1)..9]
  next if second_word_mappings.size < 3

  first_word_combinations = first_word_mappings.shift.product(*first_word_mappings).map(&:join)
  second_word_combinations = second_word_mappings.shift.product(*second_word_mappings).map(&:join)

  puts first_word_combinations.take(5)
  puts "+++"
  puts second_word_combinations.take(5)
  puts "____"

  words << [
    (first_word_combinations & dictionary[i + 1]),
    (second_word_combinations & dictionary[10 - (i + 1)])
  ]
end

puts words.inspect

word_pairs = []

words.each do |combinations|
  next if combinations.first.empty? || combinations.last.empty?
  combinations.first.product(combinations.last) do |c|
    word_pairs << c
  end
end

puts word_pairs.inspect

full_length_words = keys.shift.product(*keys).map(&:join) & dictionary[10]

word_pairs.each do |pair|
  if full_length_words.include?(pair.join(""))
    word_pairs.delete(pair)
  end
end

puts word_pairs.concat(full_length_words).inspect
