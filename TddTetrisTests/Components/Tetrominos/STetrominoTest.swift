import XCTest
import Nimble
@testable import TddTetris

class STetrominoTest: XCTestCase {
    var tetromino: STetromino!

    override func setUp() {
        tetromino = STetromino()
    }

    func test_rotate_rotatesRight() {
        let rotatedTetromino = tetromino.rotate()

        expect(rotatedTetromino.position.row).to(equal(tetromino.position.row))
        expect(rotatedTetromino.position.column).to(equal(tetromino.position.column))
    }
}
