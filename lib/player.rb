class Player

  def initialize(dimension = 3)
    @dimension = dimension
  end

  def get_next_move
    move = [rand(@dimension), rand(@dimension)]
  end
    
end