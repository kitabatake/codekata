require './binary_search_tree.rb'


RSpec.describe BinarySearchTree do
  
  let :binary_search_tree do
    binary_search_tree = BinarySearchTree.new
  end

  describe "#position" do
    it "case depth is 0" do
      depth, landscape_index = binary_search_tree.position 0
      expect(depth).to eq 0
      expect(landscape_index).to eq 0
    end

    it "case depth is 1" do
      depth, landscape_index = binary_search_tree.position 1
      expect(depth).to eq 1
      expect(landscape_index).to eq 0

      depth, landscape_index = binary_search_tree.position 2
      expect(depth).to eq 1
      expect(landscape_index).to eq 1
    end

    it "case depth is 2" do
      depth, landscape_index = binary_search_tree.position 3
      expect(depth).to eq 2
      expect(landscape_index).to eq 0

      depth, landscape_index = binary_search_tree.position 6
      expect(depth).to eq 2
      expect(landscape_index).to eq 3
    end
  end

  describe "#depth_head_index" do
    it "case depth in 0 .. 2" do
      expect(binary_search_tree.depth_head_index(0)).to eq 0
      expect(binary_search_tree.depth_head_index(1)).to eq 1
      expect(binary_search_tree.depth_head_index(2)).to eq 3
    end
  end

  describe "children node index" do
    it "case index 0" do
      expect(binary_search_tree.left_child_index(0)).to eq 1
      expect(binary_search_tree.right_child_index(0)).to eq 2
    end
  end

  describe "#add" do
    it "shallow case" do
      binary_search_tree.add 4
      binary_search_tree.add 2
      binary_search_tree.add 8
      binary_search_tree.add 10

      expect(binary_search_tree.array[0]).to eq 4
      expect(binary_search_tree.array[1]).to eq 2
      expect(binary_search_tree.array[2]).to eq 8
      expect(binary_search_tree.array[6]).to eq 10
    end
  end

  describe "#search" do
    it "shallow case" do
      binary_search_tree.add 4
      binary_search_tree.add 2
      binary_search_tree.add 8
      binary_search_tree.add 10

      expect(binary_search_tree.search(4)).to eq 0
      expect(binary_search_tree.search(2)).to eq 1
      expect(binary_search_tree.search(8)).to eq 2
      expect(binary_search_tree.search(10)).to eq 6

      expect(binary_search_tree.search(7)).to eq nil

    end
  end

  describe "#delete" do

    before do
      binary_search_tree.add 4
      binary_search_tree.add 2
      binary_search_tree.add 8
      binary_search_tree.add 10
    end

    it "delete top root num" do
     
      binary_search_tree.delete 4
      expect(binary_search_tree.array[0]).to eq 2
      expect(binary_search_tree.array[2]).to eq 8
    end
  end

end