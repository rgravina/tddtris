import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class FakeBlockGenerator: BlockGenerator {
    var nextBlock_wasCalled = false
    var nextBlock_return = Block()
    func nextBlock() -> Block {
        nextBlock_wasCalled = true
        return nextBlock_return
    }
}

class GameSceneTest: XCTestCase {
    var gameScene: GameScene!
    var fakeBlockGenerator = FakeBlockGenerator()

    override func setUp() {
        gameScene = GameScene(
            size: CGSize(width: 200, height: 300),
            blockGenerator: fakeBlockGenerator
        )
    }

    func test_init_setsLocationOfImages() {
        let background = self.gameScene.children.first as! SKSpriteNode!
        expect(background.anchorPoint).to(equal(CGPoint(x: 0, y: 0)))
        let gameBoard = self.gameScene.children[1] as! SKSpriteNode
        expect(gameBoard.anchorPoint).to(equal(CGPoint(x: 0, y: 1)))
        expect(gameBoard.position).to(equal(CGPoint(x: 12, y: gameScene.frame.height - 12)))
    }

    func test_init_displaysNextBlock() {
        expect(self.fakeBlockGenerator.nextBlock_wasCalled).to(be(true))
        let block = self.gameScene.children.last
        expect(block).to(beAKindOf(Block))
    }

    func test_init_movesNextBlockToDropCoordinates() {
        expect(self.fakeBlockGenerator.nextBlock_wasCalled).to(be(true))
        let block = self.gameScene.children.last
        expect(block?.position).to(equal(
            CGPoint(x: CGFloat(GameScene.BOARD_LEADING_PADDING + GameScene.BLOCK_SIZE * 4), y: CGFloat(300) - CGFloat(GameScene.BOARD_TOP_PADDING))
        ))
    }
}
