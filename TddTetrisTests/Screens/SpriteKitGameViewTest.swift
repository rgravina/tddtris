import XCTest
import Nimble
@testable import TddTetris

class SpriteKitGameViewTest: XCTestCase {
    var gameView: SpriteKitGameView!
    var tickHandler: SpyTickHandler!
    var inputHandler: SpyInputHandler!

    override func setUp() {
        gameView = SpriteKitGameView()
        tickHandler = SpyTickHandler()
        inputHandler = SpyInputHandler()
        gameView.configure(
            tickHandler,
            inputHandler: inputHandler,
            frame: CGRectMake(0, 0, 100, 200)
        )
    }
}
