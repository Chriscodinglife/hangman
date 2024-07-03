require_relative 'display'
require_relative 'game_logic'
require_relative 'load_word'
require_relative 'save_load'


save_load = SaveLoad.new
game_logic = GameLogic.new
display = Display.new

display.display_load_new_game
game_logic.check_user_new_load_game

if game_logic.user_wants_to_load

  if save_load.saved_games.length == 0
    
    display.display_no_saved_games

  else
    display.show_saved_games(save_load.saved_games)
    game_logic.get_user_chosen_saved_game(save_load.saved_games)

    if game_logic.user_chose_saved_game

      game_data = game_logic.chosen_saved_game[:game_data]

      word = game_data["word"]
      word_table = game_data["word_table"]
      turns_remaining = game_data["turns_remaining"]
      incorrect_chars = game_data["incorrect_chars"]
      game_logic.load_word_table(word, word_table, turns_remaining, incorrect_chars)

    end
  end

end

if game_logic.user_chose_saved_game == false

  word = LoadWord.choose_random_word
  turns_remaining = 20
  game_logic.load_word_table(word, {}, turns_remaining, {})
  game_logic.create_word_table
  
end

display.set_game_logic(game_logic)
display.display_word_hint


until game_logic.game_won == true || game_logic.turns_remaining == 0

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

