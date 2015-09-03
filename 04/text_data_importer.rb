class TextDataImporter

  @@row_split_regexp = /\s+/

  def initialize (filename)
    @rows = []
    input_file filename
  end

  def input_file (filename)
    file = File.open(filename, "r")
    file.each do |line|
      @rows.push line.split @@row_split_regexp
    end
  end

  def rows
    @rows
  end

  def filter_rows

    rows = @rows.clone
    rows.each do |row|
      valid = yield row
      @rows.delete(row) unless valid
    end
  end
end