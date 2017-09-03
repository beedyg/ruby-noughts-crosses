class Game
  attr_accessor :board

  def initialize(dimension = 3)
    @dimension = dimension
    @board = Board.new(dimension)
    @players = []
    @markers = @board.markers.keys
  end

  def start
    puts "Welcome to a Game of Noughts and Crosses"
    num_human_players = -1
    while ![0, 1, 2].include? num_human_players do
      puts "How many human players (0, 1 or 2)?"
      num_human_players = gets.chomp.to_i
    end
    puts "You chose #{num_human_players} human player#{'s' if num_human_players != 1}"

    ## next steps
    if num_human_players == 0
      @players[0] = Player.new(@dimension)
      @players[1] = Player.new(@dimension)
    elsif num_human_players == 1
      @players[0] = HumanPlayer.new(@dimension)
      @players[1] = Player.new(@dimension)
    end
    
    turn = 0
    while @board.status == :play
      print_board
      puts "It is #{turn == 0 ? 'Cross\'' : 'Nought\'s'} turn"
      move = @players[turn].get_move
      while !@board.can_place?(*move)
        move = @players[turn].get_move
      end
      @board.place_at(*move, @markers[turn])
      turn = (turn - 1).abs
    end
    puts "And the result is #{@board.status}"
    print_board
    

  end

  def print_board
    puts "\nCurrent board"
    @board.grid.each_with_index do |row, index|
      puts row.join(' | ')
      ((row.size * 3) + 1).times { print '-' } if index + 1 < @board.grid.size
      print "\n"
    end
  end
end