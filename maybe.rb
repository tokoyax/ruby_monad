class Maybe
  def initialize(val)
    @_val = val
  end

  def fmap
    return self if @_val.nil?
    self.class.new(yield @_val)
  end

  def bind
    return self if @_val.nil?
    yield @_val
  end

  def inspect
    return 'Nothing' if @_val.nil?
    'Just ' + @_val.inspect
  end
end

def highest_number(array)
  sorted = array.sort { |x, y| y <=> x }
  Maybe.new(sorted.first)
end

def clean_square_root(number)
  square = Math.sqrt(number)
  clean  = square.to_i if square == square.to_i
  Maybe.new(clean)
end
