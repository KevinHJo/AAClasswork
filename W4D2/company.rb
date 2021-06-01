require 'byebug'

class Employee
    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss)
        @employees = []
        super
    end

    def add_employee(name, title, salary, sub_ordinates = nil)
        unless sub_ordinates.nil?
            @employees << Manager.new(name, title, salary, self)
        else
            @employees << Employee.new(name, title, salary, self)
        end
    end
    
    def bonus(multiplier)
        sum = self.sum_salary
        bonus = sum * multiplier
    end

    def sum_salary
        sum = 0
        @employees.each do |employee|
            if employee.is_a?(Manager)
                sum += employee.salary + employee.sum_salary
            else
                sum += employee.salary
            end
        end
        sum
    end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
ned.add_employee("Darren", "TA Manager", 78000, "lskjdfalk")
ned.employees[0].add_employee("Shawna", "TA", 12000)
ned.employees[0].add_employee("David", "TA", 10000)

p ned.bonus(2)
