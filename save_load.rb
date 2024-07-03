require 'csv'

class SaveLoad

  CSVFILEPATH = "savefile.csv"
  HEADERS = ["id", "date", "data"]


  def initialize
   
    create_csv_file
    @total_rows = get_total_rows

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
    CSV.open(CSVFILEPATH, 'w', headers: HEADERS, write_headers: true) do |csv|
      csv << [id, new_date, data]
    end

  end

end