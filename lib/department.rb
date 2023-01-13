class Department
  attr_reader :name,
              :employees,
              :expenses,
              :expense_report

  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
    @expense_report = []
  end

  def hire(employee)
    @employees << employee
  end

  def expense(employee, amount)
    @expenses = @expenses + amount
    @expense_report << [employee, amount.to_s.prepend('$')]
  end
  
  def employee_expenses
    @expense_report.to_h
  end
end