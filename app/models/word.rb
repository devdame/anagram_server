

class Word < ActiveRecord::Base
  # Remember to create a migration!

  def self.anagrams(input)
  end

  find every word in database that have the same sorted word as this word
end
Word.anagrams("plate")
