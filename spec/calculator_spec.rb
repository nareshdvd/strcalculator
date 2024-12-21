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
end
