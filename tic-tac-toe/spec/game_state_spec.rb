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

    it "returns itself on illegal moves" do
      subject = GameState.new([[X, N, N], [N, N, N], [N, N, N]])
      new_game_state = subject.next_state(O, 0, 0)
      expect(new_game_state).to eq(subject)
    end

    it "returns itself when moved out of bounds" do
      new_game_state = subject.next_state(O, 4, 0)
      expect(new_game_state).to eq(subject)

      new_game_state = subject.next_state(O, 0, 4)
      expect(new_game_state).to eq(subject)
    end
  end
end
