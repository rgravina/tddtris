# Tddtris

This project is an experiment in test-driving a Tetris clone for the iPhone written in Swift. The game settings (like play area size, speed), assets (images, sounds), and some implementation ideas are based on the excellent [Swiftris](https://github.com/Bloc/swiftris) project and tutorial.

## Stories

When test driving this game I found it useful to define a set of user stories which gradually required more and more of the games features to be developed. For example, the first story requires loading the background and game area as images and placing them at the correct location. The second requires drawing a square block (the square is the simplest) and placing it at the top center of the game area etc.

See [Stories](Stories.md) for a list and which have been completed.

## About Tetris

A few facts about this implementation of the game will help if you attempt to test-string your own version of the game.

* The game "board" is 20 rows * 10 columns.
* Each tetromino (shape) is made up of four blocks in one of seven configurations. The types of tetrominos are - square, line, S-shape, Z-shape, L-shape, J-shape and T-shape.
* The shapes fall one row per "tick" of the clock. The starting speed it 600 milliseconds per tick.
* Shapes can be rotated (except for the square block) before they settle.
* When a shape touches a settled block, it can not be moved.
* When one or more settled blocks complete a row, the row disappears, the blocks above fall to fill the empty space, and score is gained.
* If one or more blocks touch the top row of the game area, the game is lost.
