def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_f() != 0
end

prompt "Welcome to the Mortgage Calculator! What is your name?"

name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt "Make sure you're using a valid name!"
  else
    break
  end
end

prompt "Hi #{name}!"
sleep(2.5)

loop do 
  
  loan_amount = ''
  loop do
    prompt "What's the loan amount?"
    loan_amount = gets.chomp.to_f
    if valid_number?(loan_amount)
      break
    else
      prompt "Hmmm... That doesn't appear to be a valid number."
    end
  end

  apr = ''
  monthly_interest_rate = ''
  loop do
    prompt "What's the APR amount? For example, if your APR is 5%, use .05"
    apr = gets.chomp.to_f
    monthly_interest_rate = apr / 12
    if valid_number?(monthly_interest_rate)
      break
    else
      prompt "Hmmm... That doesn't appear to be a valid APR."
    end
  end

  year_duration = ''
  monthly_duration = ''
  loop do
    prompt "How many years will the loan be for?"
    year_duration = gets.chomp.to_f
    monthly_duration = year_duration * 12
    if valid_number?(loan_amount)
      break
    else
      prompt "Hmmm... That doesn't appear to be a valid amount of years."
    end
  end

  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(- monthly_duration)))

  prompt "The monthly payment will be $#{format('%.2f', monthly_payment)}!"

  prompt "Do you want to do another calculation? (Enter 'Y' to restart)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
end

prompt "Thank you for using the Mortgage Calculator. Goodbye!"
