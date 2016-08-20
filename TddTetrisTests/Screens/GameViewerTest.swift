import XCTest
import Nimble
@testable import TddTetris

class SpriteKitGameViewTest: XCTestCase {
    var gameView: SpriteKitGameView!

    override func setUp() {
        gameView = SpriteKitGameView()
        gameView.configure(
            FakeTickHandler(),
            frame: CGRectMake(0, 0, 100, 200)
        )
    }
}
