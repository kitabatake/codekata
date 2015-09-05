require './anagram.rb'

RSpec.describe Anagram do

  describe "use simplicity word list" do
    before do
      @anagram = Anagram.new "wordlist_test.txt"
    end

    it "simplicity word list has two 'hoge' anagrams" do
      anagrams = @anagram.search_for "hoge"
      expect(anagrams.size).to eq 2
      expect(anagrams[0]).to eq "hoge"
      expect(anagrams[1]).to eq "geho"
    end
  end
end