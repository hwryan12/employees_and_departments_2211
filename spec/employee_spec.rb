require './lib/employee'

RSpec.describe Employee do
  let(:employee) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"}) }
  describe '#initialize' do
    it 'exists' do
      
      expect(employee).to be_a(Employee)
    end
  end
end
