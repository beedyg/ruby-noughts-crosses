require 'human_player'

describe HumanPlayer do

  before HumanPlayer do
    @h_player = HumanPlayer.new
  end

  it "HPlayer Can get a valid next move" do
    move = @h_player.get_move
    expect(move[0]).to be_between(0, 1)
    expect(move[1]).to be_between(0, 1)
  end

end