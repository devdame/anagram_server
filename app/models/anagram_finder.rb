class AnagramFinder
  attr_accessor :letters, :used_letters, :word_matches, :letter_matches, :word_letters, :all_matches  # => nil

  def initialize(word)
    @letters = store_letters(word)
    @used_letters = []
    @word_matches = []
    @all_matches = []
    @letter_matches = []
    @word_letters = []
  end

  def store_letters(string)
    string.gsub(" ", "").downcase.split('')
  end


  def run!

  end

  def call_me
    ["hi"]
  end


  # def find_anagrams
  #   Word.all.each do |word|
  #     if word.length <= letters.length
  #       self.word_letters = word.store_letters
  #       check_letters(word_letters)
  #       if word_found?
  #         word_matches << word
  #         used_letters.concat(letter_matches)
  #         if letters.empty?
  #           store_match
  #         else
  #           find_anagrams
  #         end
  #       end
  #       put_back_letters
  #     end
  #   end
  # end

  # def put_back_letters
  #   letter_matches.each_index do |index|
  #     letters << letter_matches.delete_at(index)
  #   end
  # end

  # def check_letters
  #   word_letters.each do |letter|
  #     match_letter?(letter, letter_matches)
  #   end
  # end

  # def store_match
  #   all_matches << word_matches.join(' ')
  # end

  # def match_letter?(letter)
  #   if letters.include?(letter)
  #     letter_matches << letters.delete_at(letters.find_index(letter))
  #   end
  # end

  # def word_found?
  #   letter_matches.length == word_letters.length
  # end


end




# for each word
#   check to see if ALL of the word's letters are in the letters array
#   for each letter, if you find it, delete it from letters and push it into used_letters
#   if all letters from word are in there, keep those letters in the used_letters array
#     otherwise put them all back

