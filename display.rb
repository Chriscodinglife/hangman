class Display


  def initialize(game_logic)
    
    @game_logic = game_logic

    puts "Welcome to Hangman!"
    puts "The Word has #{game_logic.word_length} characters!"
    puts "Good luck guessing the characters! Let's Play!"
    puts
    puts
    puts "Hit Enter To Start!"
    gets

  end


  def gen_word_table

    word_display = ""
    @game_logic.word.chomp.each_char do |char|
      
      if @game_logic.word_table[char] == true
        word_display += char
      else
        word_display += "_"
      end

    end

    puts word_display
    
  end


  def display_word_table
    
    puts ""
    puts ""
    puts ""

    gen_word_table
    puts "You have #{@game_logic.turns_remaining} turns remaining!"
    puts "Incorrect letters: #{@game_logic.incorrect_chars.keys.join}"
    puts "Select a character and hit enter"
    puts "TO SAVE: Press 1"

  end

  
  def display_load_game
    
    puts "Press Enter to Start New Game. Press 1 to Load Game"
    
  end

  def display_game_over
    
    if @game_logic.game_won
      puts "You guessed the word correctly! Hooray!"
    else
      puts "Sorry you lost! The word was: #{@game_logic.word}"
    end

  end


end