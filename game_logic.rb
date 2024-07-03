class GameLogic
  
  attr_accessor :turns_remaining, :word, :word_table
  attr_accessor :word_length, :game_won, :incorrect_chars
  attr_reader :user_wants_to_save, :user_wants_to_load
  attr_accessor :chosen_saved_game, :user_chose_saved_game


  def initialize
    
    @word = ""
    @turns_remaining = 0
    @word_length = 0
    @game_won = false
    @word_table = {}
    @incorrect_chars = {}
    @user_wants_to_save = false
    @user_wants_to_load = false
    @chosen_saved_game = {}
    @user_chose_saved_game = false

  end


  def load_word_table(word, word_table, turns_remaining, incorrect_chars)
    
    @word = word
    @word_length = word.length
    @word_table = word_table
    @turns_remaining = turns_remaining
    @incorrect_chars = incorrect_chars
  
  end



  def create_word_table

    @word.strip.each_char do |char|

      if not @word_table.has_key?(char)
        @word_table[char] = false
      end

    end
  end


  def set_character_in_table_true(character)
    
    if @word_table.has_key?(character)
      @word_table[character] = true
    end

  end


  def check_if_player_won

    @word_table.keys.each do |key|
    
      @game_won = true

      if @word_table.fetch(key) == false
        @game_won = false
        break
      end

    end

  end


  def interact_with_user
    
    guessed_correctly = false

    while true
      input = gets.chomp.downcase


      if input.length == 1 && input.match(/1/)
        @user_wants_to_save = true
        return
      elsif @incorrect_chars.has_key?(input)
        puts "You used #{input} already!"
      elsif input.length == 1 && input.match(/[a-z]/)
        guessed_correctly = set_character_in_table_true(input)
        break
      else
        puts "Please select a single character"
      end
    end

    if not guessed_correctly
      @turns_remaining -= 1
      @incorrect_chars[input] = true
    end

    check_if_player_won

  end


  def get_game_data 
    
    data = {
      :word => @word,
      :word_table => @word_table,
      :turns_remaining => @turns_remaining,
      :incorrect_chars => @incorrect_chars
    }
    
    return data

  end


  def check_user_new_load_game

    while true
      input = gets.chomp

      if input.length == 1 && input.match(/1/)
        @user_wants_to_load = true
        break
      elsif input.empty?
        break
      else
        puts "Press Enter to Start New Game. Press 1 to Load Game"
      end

    end

  end


  def get_user_chosen_saved_game(saved_games)

    saved_game_choices = {}

    count = 1
    saved_games.each do 
      saved_game_choices[count] = true
      count += 1
    end

    while true
      input = gets.chomp

      if input.match(/[1-9]/)
        if saved_game_choices.has_key?(input.to_i)
          @chosen_saved_game = input
          @user_chose_saved_game = true
          break
        else
          puts "Select a Game Save by choosing a number and hit Enter"
        end
      elsif input.match(/[0]/)
        puts "Skipping saved game selection"
        break
      else
        puts "Select a Game Save by choosing a number and hit Enter"
      end

    end

    corrected_number = input.to_i - 1
    @chosen_saved_game = saved_games[corrected_number]

    
  end
    

end