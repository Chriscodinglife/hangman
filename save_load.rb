require 'csv'
require 'json'

class SaveLoad

  attr_reader :saved_games

  CSVFILEPATH = "savefile.csv"
  HEADERS = ["id", "date", "data"]


  def initialize
   
    create_csv_file
    @total_rows = get_total_rows
    @saved_games = []

    get_saved_games

  end


  def create_csv_file
    if not File.exist?(CSVFILEPATH)
      CSV.open(CSVFILEPATH, 'w', headers: HEADERS, write_headers: true) do |csv|
      end
    end
  end


  def get_total_rows
    @total_rows = 0
    CSV.foreach(CSVFILEPATH, headers: true) do
      @total_rows += 1
    end
    @total_rows
  end


  def save(data)

    @total_rows += 1
    id = @total_rows
    d = Time.now
    new_date = d.strftime("%d/%m/%Y %H:%M")
    json_data = JSON.dump(data)
    CSV.open(CSVFILEPATH, 'a') do |csv|
      row = CSV::Row.new(HEADERS, [])
      row["id"] = id
      row["date"] = new_date
      row["data"] = json_data
      csv << row
    end

  end


  def get_saved_games
    
    old_games = []
    CSV.foreach(CSVFILEPATH, headers: true) do |row|
      game = {}
      game[:game_number] = row["id"]
      game_data = JSON.load(row["data"])
      game[:game_data] = game_data
      old_games.push(game)

      @saved_games = old_games
    end

  end

end