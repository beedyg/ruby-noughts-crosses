class HumanPlayer

  def initialize(dimension = 3)
    @dimension = dimension
  end

  def get_move
    move = nil
    while !move || move[0] < 0 || move[1] < 0
      puts "What's your next move?"
      move = gets.chomp.split(',').collect {|n| n.to_i}
      puts move.class
      puts move
    end
    move
  end
    
end