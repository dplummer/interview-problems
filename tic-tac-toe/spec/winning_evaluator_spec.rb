require 'spec_helper'

describe WinningEvaluator do
  let(:state) { [[N, N, N], [N, N, N], [N, N, N]] }

  subject { WinningEvaluator.new(state) }

  context "no moves made" do
    it "has no winner" do
      expect(subject.winner).to be_nil
    end
  end

  context "row 0 win for x" do
    let(:state) { [[X, X, X], [N, N, N], [N, N, N]] }

    it "the winner is x" do
      expect(subject.winner).to eq(X)
    end
  end

  context "row 1 win for x" do
    let(:state) { [[N, N, N], [X, X, X], [N, N, N]] }

    it "the winner is x" do
      expect(subject.winner).to eq(X)
    end
  end

  context "row 2 win for x" do
    let(:state) { [[N, N, N], [N, N, N], [X, X, X]] }

    it "the winner is x" do
      expect(subject.winner).to eq(X)
    end
  end

  context "row 0 win for o" do
    let(:state) { [[O, O, O], [N, N, N], [N, N, N]] }

    it "the winner is x" do
      expect(subject.winner).to eq(O)
    end
  end

  context "row 1 win for o" do
    let(:state) { [[N, N, N], [O, O, O], [N, N, N]] }

    it "the winner is x" do
      expect(subject.winner).to eq(O)
    end
  end

  context "row 2 win for o" do
    let(:state) { [[N, N, N], [N, N, N], [O, O, O]] }

    it "the winner is x" do
      expect(subject.winner).to eq(O)
    end
  end

  context "col A win for x" do
    let(:state) { [[X, N, N], [X, N, N], [X, N, N]] }

    it "the winner is x" do
      expect(subject.winner).to eq(X)
    end
  end

  context "col B win for x" do
    let(:state) { [[N, X, N], [N, X, N], [N, X, N]] }

    it "the winner is x" do
      expect(subject.winner).to eq(X)
    end
  end

  context "col C win for x" do
    let(:state) { [[N, N, X], [N, N, X], [N, N, X]] }

    it "the winner is X" do
      expect(subject.winner).to eq(X)
    end
  end

  context "col A win for o" do
    let(:state) { [[O, N, N], [O, N, N], [O, N, N]] }

    it "the winner is o" do
      expect(subject.winner).to eq(O)
    end
  end

  context "col B win for o" do
    let(:state) { [[N, O, N], [N, O, N], [N, O, N]] }

    it "the winner is o" do
      expect(subject.winner).to eq(O)
    end
  end

  context "col C win for o" do
    let(:state) { [[N, N, O], [N, N, O], [N, N, O]] }

    it "the winner is o" do
      expect(subject.winner).to eq(O)
    end
  end

  context "left to right diagnal win for X" do
    let(:state) { [[X, N, N], [N, X, N], [N, N, X]] }

    it "the winner is x" do
      expect(subject.winner).to eq(X)
    end
  end

  context "right to left diagnal win for O" do
    let(:state) { [[N, N, X], [N, X, N], [X, N, N]] }

    it "the winner is x" do
      expect(subject.winner).to eq(X)
    end
  end

  context "left to right diagnal win for O" do
    let(:state) { [[O, N, N], [N, O, N], [N, N, O]] }

    it "the winner is o" do
      expect(subject.winner).to eq(O)
    end
  end

  context "right to left diagnal win for O" do
    let(:state) { [[N, N, O], [N, O, N], [O, N, N]] }

    it "the winner is o" do
      expect(subject.winner).to eq(O)
    end
  end
end
