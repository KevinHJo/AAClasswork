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
        #BASE
        return @salary unless self.employees.empty?

        #INDUCTIVE

        @employees.each do |employee|
            if employee.is_a?(Manager)
                employee.sum_salary
            else
                return employee.salary
            end

        end
    end
end