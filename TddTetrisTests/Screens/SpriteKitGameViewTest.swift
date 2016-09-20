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
            frame: CGRect(x: 0, y: 0, width: 100, height: 200)
        )
    }
}
