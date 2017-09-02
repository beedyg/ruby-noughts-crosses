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

  def moves_left?
    sum = 0
    grid.each do |row|
      row.each { |v| sum += v.abs}
    end
    sum == 9
  end

  private
    def place(position, marker)
    end
end