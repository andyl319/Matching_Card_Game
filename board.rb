class Board

  def initialize
    @cards_array = Array.new(4) { [] }
  end

  def populate
    values = ([1, 2, 3, 4, 5, 6, 7, 8] * 2).shuffle!
    4.times do |x|
      4.times do |y|
        @cards_array[x][y] = Card.new(values.pop)
      end
    end
  end

  def render
    4.times do |x|
      4.times do |y|
        if @cards_array[x][y].face_up
          print @cards_array[x][y].face_value
        else
          print "X"
        end
      end
      print "\n"
    end
  end

  def won?
    4.times do |x|
      4.times do |y|
        return false unless @cards_array[x][y].face_up
      end
    end
    true
  end

  def reveal(guessed_pos)
    x, y = guessed_pos
    if @cards_array[x][y].face_up
      return
    else
      @cards_array[x][y].reveal
    end
    @cards_array[x][y].face_value
  end

  def [](pos)
    x, y = pos
    @cards_array[x][y]
  end

  # def []=(pos, value)
  #   x, y = pos
  #   @cards_array[x][y] = value[0], value[1]
  # end

end
