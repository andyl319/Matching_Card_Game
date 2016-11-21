class HumanPlayer

  def initialize(name)
    @name = name
  end

  def prompt
    puts "Please select a row and column!"
  end

  def get_input
    x = gets.chomp.to_i
    y = gets.chomp.to_i
    [x, y]
  end

  def receive_revealed_card(pos, value)
  end

  def add_match(pos1, pos2)
  end
end
