# Use a polymorphic relationship to extract the different scrambling behaviours from ScrambledDiary.
class ScrambledDiary
  def initialize(contents)
    @contents = contents
  end

  def read
    @contents
  end

  def way_of_scabmbling(way)
    way.scramble_by
  end
end

class Reversing
  def initialize(contents)
    @contents = contents
  end

  def scramble_by
    @contents = @contents.reverse
  end
end

class Advancing
  def initialize(contents, steps)
    @contents = contents
    @steps = steps
  end

  def scramble_by
    scrambled_or_plain_chars = @contents.chars
    plain_or_scrambled_chars = scrambled_or_plain_chars.map do |char|
      (char.ord - @steps).chr
    end
    @contents = plain_or_scrambled_chars.join
  end
end

class Tests
  def run
    ScrambledDiary.new("hello lala").way_of_scabmbling(Advancing.new("hello lala", -2))
    ScrambledDiary.new("hello lala").way_of_scabmbling(Reversing.new("hello lala"))
    ScrambledDiary.new("hello lala").way_of_scabmbling(Advancing.new("hello lala", 2))
  end
end

Tests.new.run
