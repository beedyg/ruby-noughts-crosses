require 'player'

describe Player do

  before Player do
    @player = Player.new
  end

  it "Can get a valid next move" do
    move = @player.get_next_move
    expect(move[0]).to eq(0 || 1)
  end

end