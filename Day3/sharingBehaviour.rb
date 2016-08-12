#-------------------modules------------------
module HourlyPay
  def calculate_salary_hourly(hours_worked)
    @hourly_rate * hours_worked
  end
end
module SalariedPay
  def calculate_salary_salaried()
    @salary / 52
  end
end


#------------------------father class----------

class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end
#------------------inherits from Employee --------------------

class HourlyEmployee < Employee
  include HourlyPay
    def initialize(name, email, hourly_rate, hours_worked)
        super(name, email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      calculate_salary_hourly(@hours_worked)
    end
end

class SalariedEmployee < Employee
  include SalariedPay
	def initialize(name, email, salary)
		super(name, email)
		@salary = salary
	end

	def calculate_salary
    calculate_salary_salaried
	end

end

class MultiPaymentEmployee < Employee
  include HourlyPay
  include SalariedPay
	def initialize(name, email, salary, hourly_rate, hours_worked)
		super(name, email)
		@salary = salary
		@hourly_rate = hourly_rate
		@hours_worked = hours_worked		
	end

	def calculate_salary
		if @hours_worked > 40
			calculate_salary_salaried + calculate_salary_hourly(@hours_worked - 40)
		else
			calculate_salary_salaried
		end
	end
end	

#---------------------Payroll--------------------



class Payroll
  def initialize(employees)
    @employees = employees
  end

  def notify_employees(employee)
    puts("#{employee.email}: Your salary of #{employee.calculate_salary}$ is done.")
  end

  def pay_employees
    @employees.reduce(0) do |memo, employee|
      salary_employee = employee.calculate_salary + employee.calculate_salary * 0.18
      puts("#{employee.name}: #{salary_employee}")
      notify_employees(employee)
    	memo + salary_employee
    end
  end
end


josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
carlos = HourlyEmployee.new('Carlos', 'carlosemail@example.com', 15, 35)
rocio = HourlyEmployee.new('Rocio', 'rocioemail@example.com', 15, 45)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)

employees = []

employees << josh
employees << carlos
employees << rocio
employees << nizar
employees << ted

payroll = Payroll.new(employees)
puts ("Total: " + (payroll.pay_employees).round(2).to_s + "$")