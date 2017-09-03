class Board
  attr_accessor :grid, :status, :markers

  def initialize(dimension = 3)
    @grid = Array.new(dimension){Array.new(dimension){0}}
    @markers = { cross: 1, nought: -1}
    @status = :play
  end

  def can_place?(row, col)
    @grid[row][col] == 0
  end

  def place_at(row, col, marker)
    #break if !valid_markers.all_keys.includes?(marker)
    @grid[row][col] = markers[marker] if can_place?(row, col)
    review_status
  end

  def review_status
    if @status == :play
      poss_winner = won_by_row + won_by_col + won_by_diagonal
      if poss_winner == -1
        @status = :won_by_nought
      elsif poss_winner == 1
        @status = :won_by_cross
      else
        @status = :draw if !moves_left?
      end
    end
  end

  def moves_left?
    number_of_empty_squares = @grid.flatten.count{|square| square == 0}
    number_of_empty_squares > 0
  end

  def won_by_row
    @grid.each do |row|
      sum = row.inject(:+)
      return sum <=> 0 if sum.abs == @grid.size
    end
    0
  end
  
  def won_by_col
    column_sums = Array.new(@grid.size){0}
    @grid.each do |row|
      row.each_with_index {|v, col_i| column_sums[col_i] += v}
    end
    column_sums.each do |total|
      return total <=> 0 if total.abs == @grid.size
    end
    0
  end

  def won_by_diagonal
    # check normal
    sum = 0
    (0..@grid.size-1).each { |i| sum += @grid[i][i] }
    return sum <=> 0 if sum.abs == @grid.size
    # check opposite
    sum = 0
    last_index = @grid.size - 1
    (0..last_index).each { |i| sum += @grid[i][(i - last_index).abs]  }
    return sum <=> 0 if sum.abs == @grid.size
    0
  end

  
end