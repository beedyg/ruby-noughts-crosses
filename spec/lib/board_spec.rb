require 'board'

describe Board do

  before Board do
    @board = Board.new
  end

  it "Can be initialized" do
    expect(@board).not_to eq(nil)
  end

  it "Has empty grid of zeroes" do
    expect(@board.grid).to eq([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
  end

  it "Can place an Cross" do
    @board.place_at(1, 1, :cross)
    expect(@board.grid[1][1]).to eq(1)
  end

  it "Can place a Nought" do
    @board.place_at(1, 1, :nought)
    expect(@board.grid[1][1]).to eq(-1)
  end

  it "Test if can_place? works" do
    expect(@board.can_place?(1, 1)).to eq(true)
    @board.place_at(1, 1, :cross)
    expect(@board.can_place?(1,1)).to eq(false)
  end

  it "Test if recognises row win" do
    expect(@board.won_by_row).to eq(0)
    @board.place_at(0, 0, :cross)
    @board.place_at(0, 1, :cross)
    @board.place_at(0, 2, :cross)
    expect(@board.won_by_row).to eq(1)
  end

  # it "Test if No more moves left" do
  #   @board.grid.each_with_index do |row, row_i|
  #     row.each { |col| @board.place_x_at(row_i,col) }
  #   end
  #   expect(@board.moves_left?).to eq(false)
  # end

  # it "All row winning condition recognised" do
  #   [[1,1,1],[1,1,0],[1,0,1]].each_with_index do |row, row_i|
  #     row.each_with_index  { |col, col_i| @board.place_x_at(row_i,col_i) if col == 1 }
  #   end
  #   expect(@board.win_by_row?).to eq(true)
  #   expect(@board.win_by_col?).to eq(true)
  #   expect(@board.win_by_norm_diag?).to eq(true)
  #   expect(@board.win_by_opp_diag?).to eq(true)
  # end

  # it "Can tell who won Xs" do
    
  #   #Diagonal
  #   @board.place_x_at(0,0)
  #   @board.place_x_at(1,1)
  #   @board.place_x_at(2,2)

  #   expect(@board.status).to eq(:won_by_x)
  # end

  # it "Can tell who won 0s" do
  #   [[-1,-1,-1],[-1,-1,0],[-1,0,-1]].each_with_index do |row, row_i|
  #     row.each_with_index  { |col, col_i| @board.place_0_at(row_i,col_i) if col == -1 }
  #   end

  #   expect(@board.get_winner).to eq(-1)
  # end

end
