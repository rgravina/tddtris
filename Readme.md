# Tddtris

Tddtris is Tetris clone for the iPhone written in Swift. The game settings (like play area, speed), assets (images, sounds), and some implementation ideas are based on the excellent [Swiftris](https://github.com/Bloc/swiftris) project and tutorial.

## Stories

While test driving this game I found it useful to define a set of user stories which gradually required the games features to be developed.

See [Stories](Stories.md) for a list and which have been completed so far.

## Design

This game only has one view controller (`GameViewController`) which renders the one Sprite Kit scene used for the entire game.

`AppDelegate.swift` instantiates all the dependencies required to begin the game, so it is a great place to start when reading the code.

* `SpriteKitGameView` - contains the `SKView` and `SKScene` required to display a Sprite Kit scene, and methods for moving tertrominos around.
* `DefaultTickHandler` - handles the tick of the game, and decides what action to take next (e.g. move the falling tetromino down one row)
* `DefaultTimeKeeper` - keeps track of the last tick time and can answer the question of if you should tick again.
* `GameLauncher` - adds the `SKView` to the main view controllers view.


```swift
let view = SpriteKitGameView()
let tickHandler = DefaultTickHandler(
    view: view,
    tetrominoGenerator: DefaultTetrominoGenerator(),
    timeKeeper: DefaultTimeKeeper()
)
let launcher = GameLauncher(
    view: view,
    tickHandler: tickHandler
)
let gameVC = GameViewController(launcher: launcher)
```
