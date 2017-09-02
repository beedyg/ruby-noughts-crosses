class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3){Array.new(3){0}}
  end

  def place_x(row, col)
    @grid[row][col] = 'X'
  end

  def can_place?(row, col)
    answer = @grid[row][col] == nil
  end

  private
    def place(position, marker)
    end
end