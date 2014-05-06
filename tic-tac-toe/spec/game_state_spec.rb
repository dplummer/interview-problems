require 'spec_helper'

describe GameState do
  subject { GameState.new(INITIAL_STATE) }

  it "compares itself with the values of the state, not its object id" do
    expect(subject).to eq(GameState.new(INITIAL_STATE))
    expect(subject).to_not eq(GameState.new([[X, N, N], [N, N, N], [N, N, N]]))
  end

  describe "#next_state" do
    it "returns a new state for the next state" do
      new_game_state = subject.next_state(X, 0, 0)
      expect(new_game_state).to_not eq(subject)
    end

    it "builds the new game state with the new move" do
      new_game_state = subject.next_state(X, 0, 0)
      expect(new_game_state).to eq(GameState.new([[X, N, N], [N, N, N], [N, N, N]]))
    end
  end
end
