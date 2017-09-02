require 'board'

describe Board do

  it "Can be initialized" do
    board = Board.new
    expect(board).not_to eq(nil)
  end
end
