class Display


  def initialize
    
    @game_logic = ""

    puts "Welcome to Hangman!"
    puts "Good luck guessing the characters! Let's Play!"
    puts
    puts

  end


  def set_game_logic(game_logic)
    @game_logic = game_logic
  end


  def display_word_hint
    
    puts "The Word has #{@game_logic.word_length} characters!"

  end


  def gen_word_table(word, word_table)

    word_display = ""
    word.chomp.each_char do |char|
      
      if word_table[char] == true
        word_display += char
      else
        word_display += "_"
      end

    end

    return word_display
    
  end


  def display_word_table
    
    puts ""
    puts ""
    puts ""

    table = gen_word_table(@game_logic.word, @game_logic.word_table)
    puts table
    puts "You have #{@game_logic.turns_remaining} turns remaining!"
    puts "Incorrect letters: #{@game_logic.incorrect_chars.keys.join}"
    puts "Select a character and hit enter"
    puts "TO SAVE: Press 1"

  end

  
  def display_load_new_game
    
    puts "Press Enter to Start New Game. Press 1 to Load Game"

  end


  def display_game_over
    
    if @game_logic.game_won
      puts "You guessed the word #{@game_logic.word} correctly! Hooray!"
    else
      puts "Sorry you lost! The word was: #{@game_logic.word}"
    end

  end


  def display_no_saved_games
    
    puts "You have no saved games!"
  end


  def show_saved_games(saved_games)

    puts "Pick a saved game with a number or Press 0 to skip"

    saved_games.each do |game|
      
      word = game[:game_data]["word"]
      word_table = game[:game_data]["word_table"]

      table = gen_word_table(word, word_table)
      puts "Game Number: #{game[:game_number]} => #{table}"
    end

  end


end