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

    def add_employee(name, title, salary)
        @employees << Employee.new(name, title, salary, self)
    end

    def bonus(multiplier)
        sum = 0
        @employees.each do |e|
            sum += e.salary
        end

        bonus = sum * multiplier
    end
end