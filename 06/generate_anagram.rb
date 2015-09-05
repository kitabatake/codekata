require './anagram.rb'

anagram = Anagram.new 'wordlist.txt'
p anagram.search_for ARGV[0]