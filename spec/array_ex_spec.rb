require "array_ex"

describe Array do

  describe '#my_uniq' do
    let(:arr) { [1,2,2,4] }

    it "returns a new array" do
      expect(arr.my_uniq).to be_a(Array)
    end

    it "removes duplicates" do
      expect(arr.my_uniq).to eq([1,2,4])
    end

    it "does not modify the original array" do
      arr.my_uniq
      expect(arr).to eq([1,2,2,4])
    end
  end

  describe '#two_sum' do
    let(:arr) { [-1, 0, 2, -2, 1] }

    it "returns a new array" do
      expect(arr.two_sum).to be_a(Array)
    end

    it "returns an empty array if no pairs match" do
      no_match = [1,2,3,4]
      expect(no_match.two_sum).to eq([])
    end

    it "returns an array of arrays if some elements pair" do
      expect(arr.two_sum[0]).to be_a(Array)
    end

    it "returns pair indices that sum to zero" do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "does not modify the original array" do
      arr.two_sum
      expect(arr).to eq([-1, 0, 2, -2, 1])
    end
  end

  describe '#my_transpose' do
    it "returns an empty array when operating on an empty array" do
      expect([].my_transpose).to eq([])
    end

    it "works on a square array" do
      arr = [[1,2], [3,4]]
      expect(arr.my_transpose).to eq([[1,3], [2,4]])
    end

    it "works on a rectangular array" do
      arr = [[1,2], [3,4], ["cat", "bob"]]
      expect(arr.my_transpose).to eq([[1,3, "cat"], [2,4, "bob"]])
    end

    it "does not modify the original" do
      arr = [[1,2], [3,4]]
      arr.my_transpose
      expect(arr).to eq([[1,2], [3,4]])
    end
  end

  describe '#stock_picker' do
    it "returns an empty array when called on an empty array" do
      expect([].stock_picker).to eq([])
    end
    it "outputs most profitable pair of days" do
      arr = [20, 40, 10, 30, 60, 20, 0]
      expect(arr.stock_picker).to eq([2,4])
    end
    it "does not modify the original" do
      arr = [20, 40, 10, 30, 60, 20, 0]
      arr.stock_picker
      expect(arr).to eq([20, 40, 10, 30, 60, 20, 0])
    end
  end

end
