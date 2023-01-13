require './lib/employee'

RSpec.describe Employee do
  let(:employee) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
  describe '#initialize' do
    it 'exists' do
      
      expect(employee).to be_a(Employee)
    end

    it "has readable attributes" do
      expect(employee.name).to eq("Bobbi Jaeger")
      expect(employee.age).to eq(30)
      expect(employee.salary).to eq(100000)
    end
  end
end
