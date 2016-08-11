import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class SpriteKitGameViewTest: XCTestCase {
    var gameView: SpriteKitGameView!

    override func setUp() {
        gameView = SpriteKitGameView()
        gameView.configure(
            FakeGame(),
            frame: CGRectMake(0, 0, 100, 200),
            timeKeeper: FakeTimeKeeper()
        )
    }
}
