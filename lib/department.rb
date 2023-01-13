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

  def total_employee_expenses
    totaled_exepenses = @expense_report.group_by(&:shift).map(&:flatten)
    employee_names = []
    totaled_exepenses.each { |expense| employee_names << expense.first }
    expense_amounts = []
    totaled_exepenses.each do |expense|
      amounts = expense.drop(1)
      expense_amounts << amounts
    end
    expense_amounts.
    # require "pry"; binding.pry
  end
end