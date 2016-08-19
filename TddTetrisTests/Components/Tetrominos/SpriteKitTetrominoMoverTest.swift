import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class SpriteKitTetrominoMoverTest: XCTestCase {
    var tetromino: Tetromino!
    var mover: SpriteKitTetrominoMover!

    override func setUp() {
        tetromino = SquareTetromino()
        mover = SpriteKitTetrominoMover(tetromino: tetromino,
                           topLeft: CGPoint(x: 10, y: 300)
        )
    }

    func test_moveToDropCoordinates_movesToTopCenter() {
        self.mover.moveToDropCoordinates()
        expect(self.tetromino.position).to(equal(
            CGPoint(x: CGFloat(10 + SpriteKitGameView.BLOCK_SIZE * 3),
                y: CGFloat(300)
            )
        ))
    }
}
