Tic-Tac-Toe
===========

Classic game of tic-tac-toe.

Design Goals
------------

I focused on building the units of the game, `GameBoardPresenter`, `GameState`,
and `WinningEvaluator` first. Then tied it all together with the command class
`TicTacToe`. I kept all the classes in the same file instead of splitting them
into individual files in `lib` so it'd be easier to read in one go.
