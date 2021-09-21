_lucky_number = 7
user_number = 0

while(user_number != _luck_number):
  user_number = input("Show me a number: ")

  if (user_number < _lucky_number):
    print("The lucky number is greater than that!")
  elif (user_number > _lucky_number):
    print("The lucky number is less than that!")

print("You guessed the lucky number!")
