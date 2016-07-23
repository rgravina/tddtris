import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class GameSceneTest: XCTestCase {
    var gameScene: GameScene!

    override func setUp() {
        gameScene = GameScene(size: CGSizeZero)
    }

    func test_init_addsBackgroundImages() {
        expect(self.gameScene.children.map{node in
            node.name
        }).to(equal(["background", "gameboard"]))
    }
}
