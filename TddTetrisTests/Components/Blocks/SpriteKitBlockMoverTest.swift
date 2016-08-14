import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class SpriteKitBlockMoverTest: XCTestCase {
    var block: Block!
    var mover: SpriteKitBlockMover!

    override func setUp() {
        block = SquareBlock()
        mover = SpriteKitBlockMover(block: block,
                           topLeft: CGPoint(x: 10, y: 300)
        )
    }

    func test_moveToDropCoordinates_movesToTopCenter() {
        self.mover.moveToDropCoordinates()
        expect(self.block.position).to(equal(
            CGPoint(x: CGFloat(10 + SpriteKitGameScene.BLOCK_SIZE * 3),
                y: CGFloat(300)
            )
        ))
    }
}
