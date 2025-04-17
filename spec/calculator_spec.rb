require './add'

RSpec.describe "#add" do
  let(:input_str) { '' }
  let(:expected_result) { 0 }

  shared_examples_for 'more than one numbers' do
    it 'retuns sum of the numbers provided' do
      expect(add(input_str)).to eq(expected_result)
    end
  end

  shared_examples_for 'with negative numbers in input' do
    it 'raises exception' do
      expect { add(input_str) }.to raise_error("negative numbers not allowed -40, -60")
    end
  end

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
    let(:input_str) { '30,40' }
    let(:expected_result) { 70 }
    it_behaves_like 'more than one numbers'
  end

  context "with new line character as delimiter" do
    let(:input_str) { '30\n40' }
    let(:expected_result) { 70 }
    it_behaves_like 'more than one numbers'
  end

  context "with new line character and comma both as delimiter" do
    let(:input_str) { '30\n40,50' }
    let(:expected_result) { 120 }
    it_behaves_like 'more than one numbers'
  end

  context "with different delimiter other than comma or newline" do
    let(:input_str) { '//;\n30;40;50' }
    let(:expected_result) { 120 }
    it_behaves_like 'more than one numbers'
  end

  context "with negative numbers in input" do
    let(:input_str) { '//;\n30;-40;50;-60' }
    it_behaves_like 'with negative numbers in input'
  end

  context "with hyphen as delimiter in input" do
    context "with only positive numbers" do
      let(:input_str) { '//-\n30-40-50-60' }
      let(:expected_result) { 180 }
      it_behaves_like 'more than one numbers'
    end

    context "with negative numbers in input" do
      let(:input_str) { '//-\n30--40-50--60' }
      it_behaves_like 'with negative numbers in input'
    end
  end
end
