require "minitest/autorun"
require "./number_to_words"

class TestNumberToWords < MiniTest::Unit::TestCase
  def test_that_it_returns_correct_words
    assert_equal NumberToWords.perform(6686787825),
      [["noun", "struck"], ["onto", "struck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"]
    assert_equal NumberToWords.perform(2282668687),
      [["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], ["acta", "mounts"], "catamounts"]
  end

  def test_that_words_are_more_than_3_chars_long
    assert no_short_words?(NumberToWords.perform(6686787825))
  end

  def no_short_words?(array)
    array.flatten.sort_by(&:length).first.length >= 3
  end
end
