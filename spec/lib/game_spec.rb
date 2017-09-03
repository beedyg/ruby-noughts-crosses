require 'game'

describe Game do

  before Game do
    @game = Game.new
  end

  it "initialises with empty board" do
    expect(@game).not_to eq(nil)
    expect(@game.board.grid).to eq([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
    expect(@game.board.status).to eq(:play)
  end
end