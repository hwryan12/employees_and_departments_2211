require './lib/department'
require './lib/employee'

RSpec.describe Department do
  let(:customer_service) { Department.new("Customer Service") }
  let(:bobbi) { Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"}) }
  let(:aaron) { Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) }
  
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
      customer_service.hire(bobbi)
      customer_service.hire(aaron)  
      
      expect(customer_service.employees).to eq([bobbi, aaron])
    end
  end

  describe "#expenses" do
    it "has zero expenses as default" do
      expect(customer_service.expenses).to eq(0)
    end

    it "can incrementally increase the expenses amount" do
      customer_service.expense("Bobbi Jaeger", 100)
      customer_service.expense("Aaron Tanaka", 25)
      
      expect(customer_service.expenses).to eq(125)
    end
  end

  describe "#Iteration 4" do
    it "has an expense_report that is empty by default" do
      expect(customer_service.expense_report).to eq([])
    end

    it "tracks employees with expenses" do
      customer_service.hire(bobbi)
      customer_service.hire(aaron) 
      customer_service.expense("Bobbi Jaeger", 37)
      customer_service.expense("Aaron Tanaka", 85)
     
      expect(customer_service.employee_expenses).to eq({"Aaron Tanaka"=>"$85", "Bobbi Jaeger"=>"$37"})
    end

    it "Returns all expenses for which a specific employee is responsible" do
      customer_service.hire(bobbi)
      customer_service.hire(aaron) 
      customer_service.expense("Bobbi Jaeger", 37)
      customer_service.expense("Bobbi Jaeger", 12)
      customer_service.expense("Aaron Tanaka", 85)
      customer_service.expense("Aaron Tanaka", 15)
      customer_service.expense("Aaron Tanaka", 50)

      expect(customer_service.total_employee_expenses).to eq({"Aaron Tanaka"=>"$150", "Bobbi Jaeger"=>"$49"})
    end
  end
end