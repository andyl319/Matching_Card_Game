class ComputerPlayer
  attr_reader :name

  def initialize
    @name = "Computer"
    @known_cards = {}
    @matched_cards = {}
    @first_guess = nil
    @second_guess = false
    @x1 = nil
    @y1 = nil
    @x2 = nil
    @y2 = nil
  end

  def prompt
    puts "#{@name} makes a guess."
  end

  def first_guess
    @known_cards.each do |key, value|
      @known_cards.each do |key2, value2|
        if key == key2 || @matched_cards.keys.include?(key)
          next
        elsif value == value2
          unless @matched_cards.keys.include?(key)
            @x1 = key[0]
            @y1 = key[1]
            @x2 = key2[0]
            @y2 = key2[1]
          end
        end
      end
    end
    if @x1.nil? && @y1.nil?
      prng = Random.new
      @x1 = prng.rand(4)
      @y1 = prng.rand(4)
    end
    @second_guess = true
    [@x1, @y1]
  end

  def second_guess
    if @x2.nil? && @y2.nil?
      @known_cards.each do |key, value|
        if value == @first_guess && key != [@x1, @y1]
          @x2 = key[0]
          @y2 = key[1]
        else
          prng = Random.new
          @x2 = prng.rand(4)
          @y2 = prng.rand(4)
        end
      end
    end
    [@x2, @y2]
  end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value
    if @first_guess.nil?
      @first_guess = value
    end
  end

  def get_input
    if @second_guess == false
      result = first_guess
    else
      result = second_guess
      @second_guess = false
      @first_guess = nil
      @x1, @y1, @x2, @y2 = nil, nil, nil, nil
      puts "reset all coordinates"
    end
    result
  end

  def add_match(pos1, pos2)
    @matched_cards[pos1] = 1
    @matched_cards[pos2] = 1
  end
end
