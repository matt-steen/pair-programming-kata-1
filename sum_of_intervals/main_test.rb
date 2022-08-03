# require_relative 'coverage'
require_relative 'main'

describe "sum_of_intervals" do

  context "base case" do
    it "computes one interval correctly" do
      expect(SumOfIntervals.sum([[1, 5]])).to eq(4)
    end

    it "handles negative numbers correctly" do
      expect(SumOfIntervals.sum([[-7, -4]])).to eq(3)
    end

    it "handles empty overall array" do
      expect(SumOfIntervals.sum([])).to eq(0)
    end
  end

  context "two arrays" do
    it "sums two non-overlapping sequences" do
      expect(SumOfIntervals.sum([[1, 5], [7, 10]])).to eq(7)
    end

    it "sums many non-overlapping sequences" do
      expect(SumOfIntervals.sum([[1, 3], [5, 7], [9, 11], [13, 15], [17, 27]])).to eq(18)
    end

    it "sums overlapping neighboring sequences" do
      expect(SumOfIntervals.sum([[1, 5], [5, 10], [10, 15]])).to eq(14)
    end
  end

  context "overlapping sequences" do
    it "sums the given example with one totally overlapping sequence where the later sequence is inside the existing one" do 
      expect(SumOfIntervals.sum([[-1, 5], [10, 15], [1, 3]])).to eq(11)
    end 

    it "sums the given example with one partially overlapping sequence" do 
      expect(SumOfIntervals.sum([[-1, 5], [10, 15], [1, 6]])).to eq(12)
    end

    it "sums the given example with one totally overlapping sequence where the later sequence encompasses the existing one" do 
      expect(SumOfIntervals.sum([[-1, 5], [10, 15], [8, 16]])).to eq(14)
    end

    it "sums a bridged sequence with the bridge last" do
      expect(SumOfIntervals.sum([[-1, 5], [10, 15], [4, 11]])).to eq(16)
    end

    it "sums a bridged sequence with the bridge first" do
      expect(SumOfIntervals.sum([[4, 11], [-1, 5], [10, 15]])).to eq(16)
    end

    it "sums a bridged sequence with the bridge in the middle" do
      expect(SumOfIntervals.sum([[-1, 5], [4, 11], [10, 15]])).to eq(16)
    end

    it "sums a chain of bridged sequences" do
      expect(SumOfIntervals.sum([[-1, 5], [10, 15], [4, 11], [20, 25], [14, 21]])).to eq(26)
    end
  end
end
