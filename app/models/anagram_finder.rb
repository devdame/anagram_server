class AnagramFinder
  attr_accessor :anagrammable_letters, :used_letters, :word_matches, :letter_matches, :dictionary_word_letters, :all_matches  # => nil

  def initialize(word)
    @anagrammable_letters = store_letters(word)
    @used_letters = []
    @word_matches = []
    @all_matches = []
    @letter_matches = []
    @dictionary_word_letters = []
    find_anagrams
  end

  def store_letters(string)
    string.gsub(" ", "").downcase.split('')
  end

=begin

OVERALL PLAN:

1.  make an array of the letters in your anagrammable.
2.  start going through your dictionary
3.  for each dict word, check if all of the letters are in the anagrammable letters
3.  if the dictionary word is in the anagrammable letters, put it in the word matches
      THEN: add the letters you matched against into your used letters (out of anagrammable)
      THEN: keep going recursively to look for the next word...
      ... BUT you only need to start at spot in dictionary where you left off!
      (make sure that's inclusive)
4.  if you used up all of the anagrammable letters, drop your last word and search from that
    last word's alphabetical point onwards
5. So, it's like in boggle, but instead of stopping when you find a match you simply log the
   match and move on.


=end


  def find_anagrams
    Word.all.each do |dict_word|
      if dict_word.word.length <= anagrammable_letters.length
        self.dictionary_word_letters = store_letters(dict_word.word)
        check_letters(dictionary_word_letters)
        if word_found?
          word_matches << dict_word
          used_letters.concat(letter_matches)
          if anagrammable_letters.empty?
            store_match
          else
            find_anagrams
          end
        end
      end
    end
  end

  def check_letters(letterable)
    letterable.each do |letter|
      match_letter?(letter)
    end
  end

  def match_letter?(letter)
    if anagrammable_letters.include?(letter)
      letter_matches << anagrammable_letters.delete_at(anagrammable_letters.find_index(letter))
    end
  end

  def store_match
    all_matches << word_matches.join(" ")
  end


  def word_found?
    letter_matches.length == dictionary_word_letters.length
  end

  def put_back_letters
    letter_matches.each_index do |index|
      anagrammable_letters << letter_matches.delete_at(index)
    end
  end




  # def find_anagrams
  #   Word.all.each do |word|
  #     if word.length <= anagrammable_letters.length
  #       self.dictionary_word_letters = word.store_letters
  #       check_letters(dictionary_word_letters)
  #       if word_found?
  #         word_matches << word
  #         used_letters.concat(letter_matches)
  #         if anagrammable_letters.empty?
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
  #     anagrammable_letters << letter_matches.delete_at(index)
  #   end
  # end

  # def check_letters(dictionary_word_letters)
  #   dictionary_word_letters.each do |letter|
  #     match_letter?(letter, letter_matches)
  #   end
  # end

  # def store_match
  #   all_matches << word_matches.join(' ')
  # end

  # def match_letter?(letter)
  #   if anagrammable_letters.include?(letter)
  #     letter_matches << anagrammable_letters.delete_at(anagrammable_letters.find_index(letter))
  #   end
  # end

  # def word_found?
  #   letter_matches.length == dictionary_word_letters.length
  # end


end




# for each word
#   check to see if ALL of the word's letters are in the letters array
#   for each letter, if you find it, delete it from letters and push it into used_letters
#   if all letters from word are in there, keep those letters in the used_letters array
#     otherwise put them all back



