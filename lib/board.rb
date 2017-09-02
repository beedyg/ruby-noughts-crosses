class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3){Array.new(3){0}}
  end

  def place_x_at(row, col)
    @grid[row][col] = -1 if can_place?(row, col)
  end

  def place_0_at(row, col)
    @grid[row][col] = 1 if can_place?(row, col)
  end

  def can_place?(row, col)
    answer = @grid[row][col] == 0
  end

  private
    def place(position, marker)
    end
end