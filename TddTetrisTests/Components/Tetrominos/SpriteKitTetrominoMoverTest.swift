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

    func test_move_movesToStartPosition() {
        let tetromino = STetromino()
        self.mover.move(tetromino)
        self.mover.display(tetromino)

        expect(self.tetromino.position).to(equal(
            CGPoint(
                x: CGFloat(10 + SpriteKitGameView.BLOCK_SIZE * 3),
                y: CGFloat(300)
            )
        ))
        expect(self.tetromino.sprites[0].position).to(equal(
            CGPoint(
                x: CGFloat(0),
                y: -CGFloat(SpriteKitGameView.BLOCK_SIZE)
            )
        ))
        expect(self.tetromino.sprites[1].position).to(equal(
            CGPoint(
                x: CGFloat(SpriteKitGameView.BLOCK_SIZE),
                y: -CGFloat(SpriteKitGameView.BLOCK_SIZE)
            )
        ))
        expect(self.tetromino.sprites[2].position).to(equal(
            CGPoint(
                x: CGFloat(SpriteKitGameView.BLOCK_SIZE),
                y: CGFloat(0)
            )
        ))
        expect(self.tetromino.sprites[3].position).to(equal(
            CGPoint(
                x: CGFloat(SpriteKitGameView.BLOCK_SIZE)*2,
                y: CGFloat(0)
            )
        ))
    }
}
