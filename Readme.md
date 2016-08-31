# Tddtris

Tddtris is Tetris clone for the iPhone written in Swift. Game settings, assets and some implementation ideas are based on the excellent [Swiftris](https://github.com/Bloc/swiftris) project and tutorial. See [Stories](Stories.md) for list of user stories.

## Design

This game only has one view controller (`GameViewController`) which renders the Sprite Kit scene used for the entire game.

`AppDelegate.swift` instantiates all the dependencies required to begin the game.

* `SpriteKitGameView` - contains the `SKView` and `SKScene` required to display a Sprite Kit scene.
* `GameState` - keeps the state of the 10 column x 20 row game grid.
* `DefaultTickHandler` - handles the 'tick' of the game.
* `DefaultTimeKeeper` - keeps track of the last tick time.
* `DefaultActionSelector` - generates an appropriate action based on the game state.
* `DefaultTetrominoGenerator` - generates a random tetromino.
* `DefaultCollisionDetector` - determines if the next move would result in a collision.
* `DefaultInputHandler` - handles left and right swipes.
* `GameLauncher` - sets `DefaultTickHandler` to handle game ticks, `DefaultInputHandler` to handle user input and gets the game started.

```swift
let view = SpriteKitGameView()
let gameState = GameState()

let tickHandler = DefaultTickHandler(
    timeKeeper: DefaultTimeKeeper(),
    actionSelector: DefaultActionSelector(
        view: view,
        tetrominoGenerator: DefaultTetrominoGenerator(),
        collisionDetector: DefaultCollisionDetector()
    ),
    gameState: gameState
)

let gameVC = GameViewController(
    launcher: GameLauncher(
        view: view,
        tickHandler: tickHandler,
        inputHandler: DefaultInputHandler(
            view: view,
            gameState: gameState
        )
    )
)
```
