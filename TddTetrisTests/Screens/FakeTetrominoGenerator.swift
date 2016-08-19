import XCTest
import Nimble
@testable import TddTetris

class FakeTetrominoGenerator: TetrominoGenerator {
    var next_wasCalled = false
    var next_return = SquareTetromino()
    func next() -> Tetromino {
        next_wasCalled = true
        return next_return
    }
}
