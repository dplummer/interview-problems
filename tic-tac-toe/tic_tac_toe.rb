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
  attr_reader :state, :player

  def initialize(state, player)
    @state = state.dup
    @player = player
    state.deep_freeze
    freeze
  end

  def next_state(row, col)
    new_state = state.map(&:dup)
    if new_state[row] && new_state[row][col] == N
      new_state[row][col] = player
      self.class.new(new_state, next_player)
    else
      self
    end
  end

  def ==(o)
    state == o.state && player == o.player
  end

  private

  def next_player
    player == X ? O : X
  end
end

class TicTacToe
  def run
    state = initial_game_state
    puts "Would you like to play a game?"
    loop do
      dispay_gameboard(state)
      if winning_player = winner(state)
        puts "#{winning_player} is the winner!"
        exit
      end

      puts "Enter a [Row][Col] for #{state.player}: (q to quit)"
      loc = gets
      if loc == "q"
        puts "Thanks for playing"
        exit
      elsif valid_input?(loc)
        row, col = parse_input(loc)
        new_state = state.next_state(row, col)
        if new_state != state
          state = new_state
        end
      else
        puts "Enter location as [RowNumber][ColumnLetter]. Try again."
      end
    end
  end

  def initial_game_state
    GameState.new(INITIAL_STATE, X)
  end

  def dispay_gameboard(state)
    puts GameBoardPresenter.new(state.state).to_s
  end

  def winner(new_state)
    WinningEvaluator.new(new_state.state).winner
  end

  def valid_input?(loc)
    loc.length == 2 &&
      ["1", "2", "3"].include?(loc[0]) &&
      ["a", "b", "c"].include?(loc[1].to_s.downcase)
  end

  def parse_input(loc)
    return loc[0].to_i - 1, ["a", "b", "c"].index(loc[1].downcase)
  end

  def gets
    print "> "
    STDIN.gets.chomp
  end
end
