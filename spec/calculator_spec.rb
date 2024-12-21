require './add'

RSpec.describe "#add" do
  context "with blank string" do
    it 'returns 0' do
      expect(add('')).to eq(0)
    end
  end
end
