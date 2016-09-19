import XCTest
import Nimble
@testable import TddTetris

class STetrominoTest: XCTestCase {
    var tetromino: STetromino!

    override func setUp() {
        tetromino = STetromino()
    }
}
