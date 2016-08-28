import XCTest
import Nimble
@testable import TddTetris

class SpriteKitTetrominoMoverTest: XCTestCase {
    var tetromino: SpriteKitTetromino!
    var mover: SpriteKitTetrominoMover!

    override func setUp() {
        tetromino = SpriteKitSquareTetromino()
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
