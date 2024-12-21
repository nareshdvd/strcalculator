require './add'

RSpec.describe "#add" do
  context "with blank string" do
    it 'returns 0' do
      expect(add('')).to eq(0)
    end
  end

  context "with single number" do
    it 'returns the same number provided in argument' do
      expect(add('45')).to eq(45)
    end
  end

  context "with any amount of numbers provided with , as delimiter" do
    it 'retuns sum of the numbers provided' do
      expect(add('30,40')).to eq(70)
    end
  end

  context "with new line character as delimiter" do
    it 'retuns sum of the numbers provided' do
      expect(add("30\n40")).to eq(70)
    end
  end

  context "with new line character and comma both as delimiter" do
    it 'retuns sum of the numbers provided' do
      expect(add("30\n40,50")).to eq(120)
    end
  end
end
