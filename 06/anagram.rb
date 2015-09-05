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

    all_words = []
    generate_words all_words, "", word.split("")

    anagrams = []
    all_words.each do |w|
      anagrams.push w if @word_list[w]
    end

    return anagrams
  end

  # generate all pattern words recursive
  # @param [Array] words container of all pattern words.
  # @oaram [String] word
  # @param [Array] chars it can add to word characters.
  def generate_words (words, word, chars)

    if chars.empty?
      words.push word
    end

    chars.each_with_index do |char, i|
      tmp_chars = chars.clone
      tmp_chars.delete_at i
      generate_words words, word + chars[i], tmp_chars
    end

  end

end