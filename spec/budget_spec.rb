require './lib/budget'
require './lib/department'
require './lib/employee'

RSpec.describe Budget do
  let(:budget) { Budget.new("2023") }

  describe '#initialize' do
    it 'exists' do
      
      expect(budget).to be_a(Budget)
    end

    it "has a readable attribute" do
      expect(budget.year).to eq("2023")
    end
  end
end