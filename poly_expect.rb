class Expect
  def initialize(value)
    @value = value
  end

  def to_equal(other)
    if @value == other
      puts "Test passed"
    else
      puts "Test failed"
    end
  end

  def to_include(other)
    if @value.include? other
      puts "Test passed"
    else
      puts "Test failed"
    end
  end

  def to_respond_to(method_name)
    if @value.respond_to? method_name
      puts "Test passed"
    else
      puts "Test failed"
    end
  end
end

class Tests
  def run
    Expect.new(5).to_equal(5)
    Expect.new([1,2,3]).to_include(2)
    Expect.new("hello").to_respond_to(:reverse)
  end
end