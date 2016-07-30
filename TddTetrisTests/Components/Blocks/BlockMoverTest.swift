import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class BlockMoverTest: XCTestCase {
    var block: Block!
    var mover: BlockMover!

    override func setUp() {
        block = Block()
        mover = BlockMover(block: block, height: CGFloat(300))
    }

    func test_moveToDropCoordinates_movesToTopCenter() {
        self.mover.moveToDropCoordinates()
        expect(self.block.position).to(equal(
            CGPoint(x: CGFloat(GameScene.BOARD_LEADING_PADDING + GameScene.BLOCK_SIZE * 4), y: CGFloat(300) - CGFloat(GameScene.BOARD_TOP_PADDING)
            )
        ))
    }
}
