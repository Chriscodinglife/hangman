class GameLogic
  
  attr_accessor :turns_remaining, :word, :word_table
  attr_accessor :word_length, :game_won, :incorrect_chars
  attr_reader :user_wants_to_save, :user_wants_to_load


  def initialize(word, word_table, turns_remaining, incorrect_chars)
    
    @word = word
    @turns_remaining = turns_remaining
    @word_length = word.length
    @game_won = false
    @word_table = word_table
    @incorrect_chars = incorrect_chars
    @user_wants_to_save = false
    @user_wants_to_load = false

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
      :turns_remaining => @turns_remaining,
      :incorrect_chars => @incorrect_chars
    }
    
    return data
  end


  def check_user_new_load_game

    while true
      input = gets.chomp.downcase

      if input.length == 1 && input.match(/1/)
        @user_wants_to_load = true
        
      end

    end

  end
    

  end


end