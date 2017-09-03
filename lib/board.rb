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

  def winning_move?
    answer = win_by_diag? || win_by_row? || win_by_col?
  end

  def moves_left?
    sum = 0
    @grid.each do |row|
      row.each { |v| sum += v.abs}
    end
    sum == 9
  end

  def win_by_row?
    answer = false
    @grid.each do |row|
      sum = 0
      row.each {|v| sum += v}
      answer = true if sum.abs == 3
    end
    answer
  end

  def win_by_col?
    answer = false
    sum_col = [0,0,0]
    @grid.each do |row|
      row.each_with_index {|v, col_i| sum_col[col_i] += v}
    end
    answer = true if sum_col.include?(-3) || sum_col.include?(3)
  end

  def win_by_diag?
    answer = win_by_opp_diag? || win_by_norm_diag?
  end

  def win_by_norm_diag?
    answer = false
    sum = 0
    (0..2).each { |i| sum += @grid[i][i] }
    answer = true if sum.abs == 3
  end

  def win_by_opp_diag?
    answer = false
    sum = 0
    (0..2).each { |i| sum += @grid[i][(i-2).abs] }
    answer = true if sum.abs == 3
  end


end