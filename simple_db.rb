class SimpleDb

def initialize
  @movies = {}
  @file = "test.db"
end

def write_to_file(key, value)
  File.open(@file, "a") { |f| f << "#{key};#{value}\n" }
end

def populate(file)
  db = File.open(@file, "r")
  key = ""
  was_key_found = false
  while true do
    character = db.read(1)
    unless character
      break
    end
    if (character == "\n")
      was_key_found = false
    elsif (character != ";" and not was_key_found)
      key += character
    elsif (character == ";")
      @movies[key] = db.tell()
      was_key_found = true
      key = ""
    end
  end
end

def print(file)
  db = File.open(@file, "r")
  @movies.each_pair do |key, offset|
    db.seek(offset)
    value = db.readline().rstrip
    puts "#{key}: #{value}\n"
  end
end


end

test_db = SimpleDb.new
test_db.write_to_file("1", "memento")
test_db.write_to_file("2", "inception")
test_db.populate(@file)
test_db.print(@file)
