VALID_CHOICES = %w(r p sc l sp)

CHOICES = { 'r' => 'rock',
            'p' => 'paper',
            'sc' => 'scissors',
            'l' => 'lizard',
            'sp' => 'spock' }

WINS = { 'sc' => %w(p, l),
         'p' => %w(r sp),
         'r' => %w(l sc),
         'l' => %w(sp p),
         'sp' => %w(sc r) }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINS[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    list_choices = ''
    CHOICES.each { |k, v| list_choices += "#{v} (#{k})  " }
    prompt("Choose one: #{list_choices}")

    choice = gets.chomp
    if CHOICES.key?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = CHOICES.keys.sample
  puts "You chose: #{CHOICES[choice]}; Computer chose: #{CHOICES[computer_choice]}"
  display_result(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
