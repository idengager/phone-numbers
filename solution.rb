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

puts map_to_letters(6686787825).inspect
