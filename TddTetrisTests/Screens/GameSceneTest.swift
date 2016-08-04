import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class FakeBlockGenerator: BlockGenerator {
    var nextBlock_wasCalled = false
    var nextBlock_return = SquareBlock()
    func nextBlock() -> Block {
        nextBlock_wasCalled = true
        return nextBlock_return
    }
}

class GameSceneTest: XCTestCase {
    var gameScene: SpriteKitGameScene!

    override func setUp() {
        gameScene = SpriteKitGameScene(
            size: CGSize(width: 200, height: 300)
        )
    }
}
