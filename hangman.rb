require_relative 'display'
require_relative 'game_logic'
require_relative 'load_word'
require_relative 'save_load'


save_load = SaveLoad.new
word = LoadWord.choose_random_word
game_logic = GameLogic.new(word, {}, 20, {})
game_logic.create_word_table
display = Display.new(game_logic)


display.display_load_game

until game_logic.game_won == true || game_logic.turns_remaining == 0

  puts word
  display.display_word_table

  game_logic.interact_with_user

  if game_logic.user_wants_to_save
    
    save_load.save(game_logic.get_game_data)
    puts "Your game has been saved!"
    exit
  end

  if game_logic.game_won
    break
  end

end

display.display_game_over

