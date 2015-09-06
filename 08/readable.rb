words_file = File.open('wordlist.txt', "r")

six_length_words = []
words_hash = {}

words_file.each do |word|
  word = word.chomp
  six_length_words << word if word.length == 6
  words_hash[word] = true
end

six_length_words.each do |word|

  (1..5).each do |first_length|
    first = word[0, first_length]
    second = word[first_length, word.length - first_length]
    
    if words_hash[first] && words_hash[second]
      puts "#{first} + #{second} => #{word}"
    end
  end
end 


