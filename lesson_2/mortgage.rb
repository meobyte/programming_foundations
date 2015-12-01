def prompt(message)
  puts "=> #{message}"
end

def positive?(input)
  input.to_f > 0
end

def validate_input
  input = gets.chomp

  return input if positive?(input)

  prompt("Please enter a positive number:")
  validate_input
end

def calculate_payment(loan_amount, loan_apr, loan_years)
  loan_months = loan_years.to_f * 12
  monthly_interest = (loan_apr.to_f / 100) / 12

  loan_amount.to_f * (monthly_interest /
  (1 - (1 + monthly_interest)**-loan_months.to_i))
end

puts("Welcome to the mortgage calculator!")

loop do
  prompt("Enter the loan amount:")
  loan_amount = validate_input

  prompt("Enter the Annual Percentage Rate (APR)")
  loan_apr = validate_input

  prompt("Enter the loan duration in years:")
  loan_years = validate_input

  payment = calculate_payment(loan_amount, loan_apr, loan_years)

  prompt("The monthly payment is #{format('%02.2f', payment)}")
  prompt("Calculate another loan?")
  user_continue = gets.chomp

  break unless user_continue.downcase.start_with?('y')
end

puts "Goodbye!"
