class LoadWord

  def self.choose_random_word 
    
    words_file = 'words.txt'

    words = []
    File.readlines(words_file).each do |word|
      
      word = word.chomp
      if word.length >= 5 && word.length <= 12
        words.push(word)
      end

    end

    words[Random.rand(words.length)]

  end

  
end