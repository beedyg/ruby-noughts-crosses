class Game
  attr_accessor :board

  def initialize(dimension = 3)
    @board = Board.new(dimension)
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

  end
end