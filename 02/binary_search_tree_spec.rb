require './binary_search_tree.rb'


RSpec.describe BinarySearchTree do
  
  before do
    @binary_search_tree = BinarySearchTree.new [15, 3, 4, 6, 11, 13, 22, 30, 24, 28]
  end

  describe "#depth" do
    it "found elements" do
      expect(@binary_search_tree.depth(15)).to eq 0
      expect(@binary_search_tree.depth(3)).to eq 1
      expect(@binary_search_tree.depth(4)).to eq 2
      expect(@binary_search_tree.depth(6)).to eq 3
      expect(@binary_search_tree.depth(22)).to eq 1
    end
  end

  describe "#sorted_array" do
    it "is sorted" do
      array = @binary_search_tree.sorted_array
      expect(array[0]).to eq 3
      expect(array[1]).to eq 4
      expect(array.last).to eq 30
    end
  end
end