require 'player'

describe Player do

  before Player do
    @player = Player.new
  end

  it "CPUPlayer Can get a valid next move" do
    move = @player.get_move
    expect(move[0]).to be_between(0, 1)
    expect(move[1]).to be_between(0, 1)
  end

end