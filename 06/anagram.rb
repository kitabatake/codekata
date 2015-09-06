class Anagram

  def initialize (word_list_filename)
    @word_list = {}
    import_wordlist word_list_filename
  end

  def import_wordlist (filename)

    file = File.open(filename, "r")
    file.each do |word|
      @word_list[word.chomp] = true
    end
  end

  # search anagrams for a word
  # @param [String] word
  # @return [Array] anagrams
  def search_for (word)

    chars = word.split("")
    all_words = chars.permutation(chars.size).map{|_chars|
      _chars.join ""
    }

    anagrams = []
    all_words.each do |w|
      anagrams.push w if @word_list[w]
    end

    return anagrams
  end

end