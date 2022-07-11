VALID_CHOICES = ['Rock', 'Paper', 'Scissors']

def prompt(message)
  puts "=> #{message}"
end

def shoot
  prompt "ROCK..." 
  sleep 0.5
  prompt "PAPER..."
  sleep 0.5
  prompt "SCISSORS... "
  sleep 0.5
  prompt "SHOOT!"
end

def no_shoot
  prompt "ROCK..." 
  sleep 0.5
  prompt "PAPER..."
  sleep 0.5
  prompt "SCISSORS... "
end

def win?(first, second)
  first == 'Rock' && second == 'Scissors' ||
    first == 'Paper' && second == 'Rock' ||
    first == 'Scissors' && second == 'Paper'
end


def display_results(player, computer)
  if win?(player, computer)
    prompt "You won!"
  elsif win?(computer, player)
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

prompt "Let's play Rock, Paper, Scissors! Which way do you play?"
sleep 1
puts shoot
sleep 1
prompt "Or..."
sleep 1
puts no_shoot
sleep 1

shoot_or_no_shoot = ''
loop do
  prompt "Type,'1' to use shoot, or type, '2' for no shoot."
  shoot_or_no_shoot = gets.chomp
  if shoot_or_no_shoot.include?('1')
    break
  elsif shoot_or_no_shoot.include?('2')
    break
  else 
    prompt "Invalid response."
  end
end

choice = ''
loop do
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp.capitalize

    if VALID_CHOICES.include?(choice.capitalize)
      break
    else
      prompt "That's not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample
  if shoot_or_no_shoot == '1'
    prompt shoot
    puts "You chose: #{choice.capitalize}. Computer chose #{computer_choice.capitalize}."
  else 
    prompt no_shoot
    puts "You chose: #{choice.capitalize}. Computer chose #{computer_choice.capitalize}."
  end
  
  display_results(choice, computer_choice)

  prompt "Do you want to play again? (Type 'Y' to play again!)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing. Goodbye for now!"
