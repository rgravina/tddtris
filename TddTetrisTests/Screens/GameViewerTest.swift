import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class SpriteKitGameViewTest: XCTestCase {
    var gameView: SpriteKitGameView!

    override func setUp() {
        gameView = SpriteKitGameView()
        gameView.configure(
            CGRectMake(0, 0, 100, 200)
        )
    }
}
