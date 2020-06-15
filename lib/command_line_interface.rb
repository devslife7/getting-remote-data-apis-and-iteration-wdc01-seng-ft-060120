def welcome
  # puts out a welcome message here!
  puts "Welcome to Star Wars interface program"
end

def get_character_from_user
  puts "please enter a character name"
  character = gets.chomp()
  character.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
