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
    @board.place_x_at(1,1)
    expect(@board.grid[1][1]).to eq(-1)
  end

  it "Can place a Nought" do
    @board.place_0_at(1,1)
    expect(@board.grid[1][1]).to eq(1)
  end

  it "Test if can_place? works" do
    @board.place_x_at(1,1)
    expect(@board.can_place?(1,1)).to eq(false)
    expect(@board.can_place?(0,1)).to eq(true)
  end
end
