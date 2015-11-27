require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  Integer(input)
rescue
  false
end

def float?(input)
  Float(input)
rescue
  false
end

def valid_number?(input)
  integer?(input) || float?(input)
end

def operation_to_message(op)
  operation = case op
              when '1'
                MESSAGES['adding']
              when '2'
                MESSAGES['subtracting']
              when '3'
                MESSAGES['multiplying']
              when '4'
                MESSAGES['dividing']
              end
  operation
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("#{MESSAGES['greeting']} #{name}")

loop do
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['operator'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_operator'])
    end
  end

  prompt("#{operation_to_message(operator)} #{MESSAGES['operator_action']}")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("#{MESSAGES['result']} #{result}")

  prompt(MESSAGES['continue'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])
