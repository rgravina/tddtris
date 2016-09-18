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

    func test_move_movesToPosition() {
        self.mover.move(
            STetromino(
                position: (3, 1),
                blocks: []
            )
        )
        expect(self.tetromino.position).to(equal(
            CGPoint(x: CGFloat(10 + SpriteKitGameView.BLOCK_SIZE * 3),
                y: CGFloat(300 - SpriteKitGameView.BLOCK_SIZE)
            )
        ))
    }
}
