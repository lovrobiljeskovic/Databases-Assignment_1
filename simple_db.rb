class SimpleDb
  def initialize
    @movies = {}
  end

  def write_to_db(key, value)
    @movies.store(key, value)
  end

  def read_from_db(movies)
    @movies.each_pair do |key, value|
      puts "key: #{key} value: #{value}"
    end
  end
end

c = SimpleDb.new
c.write_to_db("1", "memento")
c.write_to_db("2", "interstellar")
c.write_to_db("3", "prestige")
c.read_from_db(@movies)
