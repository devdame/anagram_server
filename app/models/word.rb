

class Word < ActiveRecord::Base
  # Remember to create a migration!

  def self.anagrams(input)
    Word.where(sorted_word: input.downcase.split('').sort.join).pluck(:word)
  end

  # find every word in database that have the same sorted word as this word
end
