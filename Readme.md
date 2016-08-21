# Tddtris

Tddtris is Tetris clone for the iPhone written in Swift. Game settings, assets and some implementation ideas are based on the excellent [Swiftris](https://github.com/Bloc/swiftris) project and tutorial. See [Stories](Stories.md) for list of user stories.

## Design

This game only has one view controller (`GameViewController`) which renders the Sprite Kit scene used for the entire game.

`AppDelegate.swift` instantiates all the dependencies required to begin the game.

* `SpriteKitGameView` - contains the `SKView` and `SKScene` required to display a Sprite Kit scene.
* `DefaultTickHandler` - handles the 'tick' of the game.
* `DefaultTimeKeeper` - keeps track of the last tick time.
* `GameLauncher` - sets `DefaultTickHandler` and the delegate to handle SpriteKit updates to get the game started.

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
