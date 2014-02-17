require_relative '../app/models/word'

class WordsImporter
  def self.import
    File.open('words').each_line do |line|
      Word.create(word: line.chomp, sorted_word: line.chomp.downcase.split('').sort.join)
    end
  end
end

WordsImporter.import
