require './text_data_importer'

class WeatherData

  def initialize (filename)

    text_data_importer = TextDataImporter.new filename
    text_data_importer.filter_rows {|row|
      row[1] && row[1].to_i > 0
    }

    @smallest_data = to_smallest text_data_importer.rows
  end

  def to_smallest (rows)

    smallest_data = []

    rows.each do |row|
      smallest_data.push({
        day: row[1],
        max: row[2],
        min: row[3]
      })
    end

    return smallest_data
  end

  def output
    output = ""

    @smallest_data.each do |row|
      output << sprintf("%2d % 3s % 3s\n", row[:day].to_i, row[:min], row[:max])
    end

    return output
  end
end

w = WeatherData.new "weather.dat"
puts w.output