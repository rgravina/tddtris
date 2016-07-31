import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class BlockMoverTest: XCTestCase {
    var block: Block!
    var mover: BlockMover!

    override func setUp() {
        block = SquareBlock()
        mover = BlockMover(block: block,
                           topLeft: CGPoint(x: 10, y: 300)
        )
    }

    func test_moveToDropCoordinates_movesToTopCenter() {
        self.mover.moveToDropCoordinates()
        expect(self.block.position).to(equal(
            CGPoint(x: CGFloat(10 + GameScene.BLOCK_SIZE * 4),
                y: CGFloat(300)
            )
        ))
    }
}
