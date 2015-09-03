require './text_data_importer'

class FootballData

  def initialize (filename)

    text_data_importer = TextDataImporter.new filename
    text_data_importer.filter_rows {|row|
      row[1] && row[1].match(/\d+\./)
    }

    @smallest_data = to_smallest text_data_importer.rows
  end

  def to_smallest (rows)

    smallest_data = []

    rows.each do |row|
      smallest_data.push({
        name: row[2],
        goal_difference: row[7].to_i - row[9].to_i,
        })
    end

    return smallest_data
  end

  def output
    output = ""

    @smallest_data.each do |row|
      output << sprintf("%-15s %3d\n", row[:name], row[:goal_difference])
    end

    return output
  end
end

f = FootballData.new "football.dat"
puts f.output