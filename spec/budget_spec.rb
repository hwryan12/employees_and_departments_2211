require './lib/budget'
require './lib/department'
require './lib/employee'

RSpec.describe Budget do
  let(:budget) { Budget.new("2023") }

  describe '#initialize' do
    it 'exists' do
      
      expect(budget).to be_a(Budget)
    end

    it "has a year" do
      expect(budget.year).to eq("2023")
    end

    it "has a list of departments that are empty by default" do
      expect(budget.departments).to eq([])
    end
  end
end