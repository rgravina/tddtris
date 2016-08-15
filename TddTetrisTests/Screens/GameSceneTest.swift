import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class FakeTetrominoGenerator: TetrominoGenerator {
    var next_wasCalled = false
    var next_return = SquareTetromino()
    func next() -> Tetromino {
        next_wasCalled = true
        return next_return
    }
}

class GameSceneTest: XCTestCase {
    var gameScene: SpriteKitGameScene!

    override func setUp() {
        gameScene = SpriteKitGameScene(
            game: FakeGame(),
            size: CGSize(width: 200, height: 300),
            timeKeeper: FakeTimeKeeper()
        )
    }
}
