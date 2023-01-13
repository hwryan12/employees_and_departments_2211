require './lib/budget'
require './lib/department'
require './lib/employee'

RSpec.describe Budget do
  let(:budget) { Budget.new("2023") }
  let(:dot) { Department.new("Department of Transportation") }
  let(:p_and_r) { Department.new("Parks and Recreation") }

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

  describe "#list_dept_by_expenses" do
    it "can add departments to departments array" do
      budget.add_department(dot)
      budget.add_department(p_and_r)

      expect(budget.departments).to eq([dot, p_and_r])
    end
  end
end