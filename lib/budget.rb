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
    @departments.each { |department| depts << department if department.expenses < expense.tr('$', '').to_i }
    depts
  end

  def list_employee_salary
    employees_by_department = []
    @departments.each { |department| employees_by_department << department.employees }
    all_employees = employees_by_department.flatten
    employees_and_salaries = Hash.new
    all_employees.each { |employee| employees_and_salaries[employee.name] = employee.salary.to_s.prepend('$') }
    employees_and_salaries
  end
end