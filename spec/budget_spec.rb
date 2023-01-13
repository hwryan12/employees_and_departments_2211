require './lib/budget'
require './lib/department'
require './lib/employee'

RSpec.describe Budget do
  let(:budget) { Budget.new("2023") }
  let(:dot) { Department.new("Department of Transportation") }
  let(:p_and_r) { Department.new("Parks and Recreation") }
  let(:leslie) { Employee.new({name: "Leslie Knope", age: "39", salary: "50000"}) }
  let(:ron) { Employee.new({name: "Ron Swanson", age: "50", salary: "75000"}) }
  let(:jeremy) { Employee.new({name: "Jeremy Jamm", age: "45", salary: "62000"}) }


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

    it "can list the departments with expenses less than the given amount (the argument)" do
      budget.add_department(dot)
      budget.add_department(p_and_r)

      dot.expense(6000)
      p_and_r.expense(400)
    
      expect(budget.list_dept_by_expenses("$500")).to eq([p_and_r])
    end
  end

  describe "#list_employee_salary" do
    it "returns a list of employee salaries as an array" do
      budget.add_department(dot)
      budget.add_department(p_and_r)

      p_and_r.hire(ron)
      p_and_r.hire(leslie)
      dot.hire(jeremy)

      expect(budget.list_employee_salary).to eq({ 
        "Ron Swanson" => "$75000",
        "Leslie Knope" => "$50000",
        "Jeremy Jamm" => "$62000"                        
      })
    end
  end

  describe "#employee_expenses" do
  it "returns which employee is responsible for an expense" do
    budget.add_department(dot)
    budget.add_department(p_and_r)

    p_and_r.hire(ron)
    p_and_r.hire(leslie)
    dot.hire(jeremy)

    p_and_r.expense(100)
    dot.expense(25)

    expect(budget.employee_expenses).to eq({"Leslie Knope" => "$100", "Jeremy Jamm" => "$25"})
  end
end
end