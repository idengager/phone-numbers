module NumberToWords
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

  def self.perform(number)
    keys = number.to_s.chars.map{ |digit| MAPPINGS[digit.to_i] }

    dictionary = {}

    for i in (1..10)
      dictionary[i] = []
    end

    File.open("./dictionary.txt", "r") do |file|
      file.each_line do |line|
        length = line.strip.length
        if length <= 10
          dictionary[length] << line.strip.downcase
        end
      end
    end

    words = []

    for i in (2..7)
      first_word_mappings = keys[0..i]
      next if first_word_mappings.size < 3

      second_word_mappings = keys[(i + 1)..9]
      next if second_word_mappings.size < 3

      first_word_combinations = first_word_mappings.shift.product(*first_word_mappings).map(&:join)
      second_word_combinations = second_word_mappings.shift.product(*second_word_mappings).map(&:join)

      words << [
        (first_word_combinations & dictionary[i + 1]),
        (second_word_combinations & dictionary[10 - (i + 1)])
      ]
    end

    word_pairs = []

    words.each do |combinations|
      next if combinations.first.empty? || combinations.last.empty?
      combinations.first.product(combinations.last) do |c|
        word_pairs << c
      end
    end

    full_length_words = keys.shift.product(*keys).map(&:join) & dictionary[10]

    word_pairs.each do |pair|
      if full_length_words.include?(pair.join(""))
        word_pairs.delete(pair)
      end
    end

    word_pairs.concat(full_length_words)
  end
end
