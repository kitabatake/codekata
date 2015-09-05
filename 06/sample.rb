require './anagram.rb'

anagram = Anagram.new

words = []
anagram.generate_words words, "", ['a', 'b', 'c']

p words