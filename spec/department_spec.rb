require './lib/department'
require './lib/employee'

RSpec.describe Department do
  let(:customer_service) { Department.new("Customer Service") }
  describe '#initialize' do
    it 'exists' do
  
      expect(customer_service).to be_a(Department)
    end
    
    it "has readable attributes with employees empty by default" do
      expect(customer_service.name).to eq("Customer Service")
      expect(customer_service.employees).to eq([])
    end
  end

  describe "#hire" do
    it "can hire an employee and return as an array" do
      bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
      aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 

      customer_service.hire(bobbi)
      customer_service.hire(aaron)  
      
      expect(customer_service.employees).to eq([bobbi, aaron])
    end
  end
end