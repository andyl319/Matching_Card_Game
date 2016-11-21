require_relative 'board'
require_relative 'card'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :previous_guess

  def initialize(player)
    @board = Board.new
    @board.populate
    @previous_guess = nil
    @player = player
  end

  def play
    while !@board.won?
      @board.render
      @player.prompt
      x, y = @player.get_input
      if @board[[x, y]].face_up
        puts "Please guess again!"
        next
      end
      @board.reveal([x, y])
      @player.receive_revealed_card([x, y], @board[[x, y]].face_value)
      @board.render
      check_guess(x, y)
      system("clear")
    end

    puts "#{@player.name} has won!"
  end

  def check_guess(x, y)
    if @previous_guess == nil
      @previous_guess = [x, y]
    else
      prev_x, prev_y = @previous_guess[0], @previous_guess[1]
      if !@board[[x, y]].equals(@board[[prev_x, prev_y]])
        puts "These are not a match."
        sleep(3)
        @board[[x, y]].hide
        @board[[prev_x, prev_y]].hide
      else
        @player.add_match([x, y], [prev_x, prev_y])
      end
      @previous_guess = nil
    end
  end
end

if $PROGRAM_NAME == __FILE__
  player = ComputerPlayer.new()
  # player = HumanPlayer.new("BoB")
  game = Game.new(player)
  game.play
end
