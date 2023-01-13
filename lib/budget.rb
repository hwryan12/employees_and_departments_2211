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

  def list_employee_salary
    employees_by_department = []
    @departments.each do |department|
      employees_by_department << department.employees
    end
    all_employees = employees_by_department.flatten
    employees_and_salaries = Hash.new
    all_employees.each do |employee|
      employees_and_salaries[employee.name] = employee.salary.to_s.prepend('$')
    end
    employees_and_salaries
  end
end