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
    if status == :play
      #status = :in_play if @grid.flatten.count {|g| g != 0} > 0
    #elsif

    end
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
      puts total
      return total <=> 0 if total.abs == @grid.size
    end
    0
  end

  



  # def winning_move?
  #   answer = win_by_diag? || win_by_row? || win_by_col?
  # end

  # def moves_left?
  #   sum = 0
  #   @grid.each do |row|
  #     row.each { |v| sum += v.abs}
  #   end
  #   sum == 9
  # end

  # def win_by_row?
  #   answer = false
  #   @grid.each do |row|
  #     sum = 0
  #     row.each {|v| sum += v}
  #     answer = true if sum.abs == 3
  #   end
  #   answer
  # end

  # def win_by_col?
  #   answer = false
  #   sum_col = [0,0,0]
  #   @grid.each do |row|
  #     row.each_with_index {|v, col_i| sum_col[col_i] += v}
  #   end
  #   answer = true if sum_col.include?(-3) || sum_col.include?(3)
  # end

  # def win_by_diag?
  #   answer = win_by_opp_diag? || win_by_norm_diag?
  # end

  # def win_by_norm_diag?
  #   answer = false
  #   sum = 0
  #   (0..2).each { |i| sum += @grid[i][i] }
  #   answer = true if sum.abs == 3
  # end

  # def win_by_opp_diag?
  #   answer = false
  #   sum = 0
  #   (0..2).each { |i| sum += @grid[i][(i-2).abs] }
  #   answer = true if sum.abs == 3
  # end


end