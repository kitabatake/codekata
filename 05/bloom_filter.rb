require 'objspace'

class BloomFilter

  def initialize
    @hash = {}
    @array = []
  end

  def import_wordlist (filepath)
    file = File.open(filepath, "r")
    file.each do |word|
      @hash[word.chomp] = true
      # @array.push word
    end

    puts "finish import wordlist"
  end

  def check (word)
    @hash[word]
  end
end

bf = BloomFilter.new
bf.import_wordlist "./wordlist.txt"

puts "word is contained" if bf.check "A"
puts "hoge is contained" if bf.check "hoge"