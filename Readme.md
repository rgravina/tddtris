# Tddtris

Tddtris is Tetris clone for the iPhone written in Swift. Game settings, assets and some implementation ideas are based on the excellent [Swiftris](https://github.com/Bloc/swiftris) project and tutorial. See [Stories](Stories.md) for list of user stories.

## Design

This game only has one view controller (`GameViewController`) which renders the Sprite Kit scene used for the entire game.

`AppDelegate.swift` instantiates all the dependencies required to begin the game.

* `SpriteKitGameView` - contains the `SKView` and `SKScene` required to display a Sprite Kit scene.
* `DefaultTickHandler` - handles the 'tick' of the game.
* `DefaultTimeKeeper` - keeps track of the last tick time.
* `DefaultActionSelector` - a factory which takes in dependencies needed to handle actions and generates an an action object.
* `DefaultTetrominoGenerator` - generates a random tetromino.
* `DefaultCollisionDetector` - determines if the next move would result in a collision.
* `GameLauncher` - sets `DefaultTickHandler` as the delegate to handle game ticks and gets the game started.

```swift
let view = SpriteKitGameView()

let tickHandler = DefaultTickHandler(
    timeKeeper: DefaultTimeKeeper(),
    actionSelector: DefaultActionSelector(
        view: view,
        tetrominoGenerator: DefaultTetrominoGenerator(),
        collisionDetector: DefaultCollisionDetector()
    )
)

let gameVC = GameViewController(
    launcher: GameLauncher(
        view: view,
        tickHandler: tickHandler
    )
)
```
