class Budget
  attr_reader :year,
              :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def list_dept_by_expenses(expense)
    depts = []
    @departments.each do |department|
      depts << department if department.expenses < expense.tr('$', '').to_i
    end
    depts
  end
end