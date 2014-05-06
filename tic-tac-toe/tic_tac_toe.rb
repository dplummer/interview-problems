N = " ".freeze
X = "x".freeze
O = "o".freeze
INITIAL_STATE = [[N, N, N], [N, N, N], [N, N, N]]

class GameBoardPresenter
  attr_reader :state

  def initialize(state)
    @state = state
  end

  def to_s
    <<-EOS
    A   B   C
1  #{row(0)}
   -----------
2  #{row(1)}
   -----------
3  #{row(2)}
    EOS
  end

  private

  def row(n)
    " #{cell(n, 0)} | #{cell(n, 1)} | #{cell(n, 2)} "
  end

  def cell(row, col)
    state[row][col].to_s
  end
end

class WinningEvaluator
  attr_reader :state

  def initialize(state)
    @state = state
  end

  def winner
    row_winner || col_winner || diag_winner
  end

  def row_winner
    (0..2).each do |n|
      if state[n] == [X, X, X]
        return X
      elsif state[n] == [O, O, O]
        return O
      end
    end
    nil
  end

  def col_winner
    (0..2).each do |n|
      col = state.map{|row| row[n]}
      if col == [X, X, X]
        return X
      elsif col == [O, O, O]
        return O
      end
    end
    nil
  end

  def diag_winner
    if state == [[X, N, N], [N, X, N], [N, N, X]] ||
        state == [[N, N, X], [N, X, N], [X, N, N]]
      X
    elsif state == [[O, N, N], [N, O, N], [N, N, O]] ||
        state == [[N, N, O], [N, O, N], [O, N, N]]
      O
    end
  end
end

class Array
  def deep_freeze
    each { |j| j.deep_freeze if j.respond_to? :deep_freeze }
    freeze
  end
end

class GameState
  attr_reader :state

  def initialize(state)
    @state = state.dup
    state.deep_freeze
    freeze
  end

  def next_state(player, x, y)
    new_state = state.map{|row| row.dup}
    new_state[y][x] = player
    self.class.new(new_state)
  end

  def ==(o)
    state == o.state
  end
end

class TicTacToe
  def run
    puts "Would you like to play a game?"
    state = INITIAL_STATE
    puts GameBoardPresenter.new(state).to_s
  end
end
