require 'board'

describe Board do

  it "Can be initialized" do
    board = Board.new
    expect(board).not_to eq(nil)
  end

  it "Has empty grid" do
    board = Board.new
    expect(board.grid).to eq([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
  end

  it "Can place a piece" do
    board = Board.new
    board.place_x(1,1)
    expect(board.grid[1][1]).to eq('X')
  end

  it "Test if can_place? works" do
    board = Board.new
    board.place_x(1,1)
    expect(board.can_place?(1,1)).to eq(false)
  end
end
