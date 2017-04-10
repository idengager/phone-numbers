require 'trie'

MAPPINGS = [
  nil,
  nil,
  %w(a b c),
  %w(d e f),
  %w(g h i),
  %w(j k l),
  %w(m n o),
  %w(p q r s),
  %w(t u v),
  %w(w x y z)
]

trie = Trie.new

File.open("./dictionary.txt", "r") do |file|
  file.each_line do |line|
    trie.add(line.strip)
  end
end

puts "done"

public

def map_to_letters(number)
  letter_array = []

  return if number.to_s.length < 3

  number.to_s.split('').each do |int|
    letter_array << MAPPINGS[int.to_i]
  end

  return letter_array.inspect
end

puts map_to_letters(8)
puts map_to_letters(66867)
