class Employee
  attr_reader :name,
              :age,
              :salary

  def initialize(info)
    @name = info[:name]
    @age = info[:age].tr('$', '').to_i
    @salary = info[:salary].tr('$', '').to_i
  end
end