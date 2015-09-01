require './array_binary_search.rb'

RSpec.describe Array do

  describe "#binary_search" do
    let :array do
      array = [1, 3, 4, 6, 11, 13, 22, 24, 28, 30]
    end

    it "found elements" do
      expect(array.binary_search(1)).to eq 0
      expect(array.binary_search(11)).to eq 4
      expect(array.binary_search(22)).to eq 6
      expect(array.binary_search(30)).to eq 9
    end

    it "not found elements" do
      expect(array.binary_search(-1)).to eq nil
      expect(array.binary_search(5)).to eq nil
      expect(array.binary_search(50)).to eq nil
    end
  end
end