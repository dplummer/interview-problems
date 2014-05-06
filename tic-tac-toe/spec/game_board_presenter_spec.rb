require 'spec_helper'

describe GameBoardPresenter do
  let(:state) { [[N, N, N], [N, N, N], [N, N, N]] }

  subject { GameBoardPresenter.new(state) }

  context "initial state" do
    it "has no Xs or Os on the board" do
      expect(subject.to_s).to eq(<<-EOS)
    A   B   C
1     |   |   
   -----------
2     |   |   
   -----------
3     |   |   
      EOS
    end
  end

  context "game state with an X on the board" do
    let(:state) { [[X, N, N], [N, N, N], [N, N, N]] }

    it "renders the X in the correct position" do
      expect(subject.to_s).to eq(<<-EOS)
    A   B   C
1   x |   |   
   -----------
2     |   |   
   -----------
3     |   |   
      EOS
    end
  end

  context "game state with Xs and Os" do
    let(:state) { [[X, O, X], [O, X, O], [O, X, O]] }

    it "renders the X in the correct position" do
      expect(subject.to_s).to eq(<<-EOS)
    A   B   C
1   x | o | x 
   -----------
2   o | x | o 
   -----------
3   o | x | o 
      EOS
    end
  end
end
