import XCTest
import Nimble
@testable import TddTetris

class SpyTetrominoGenerator: TetrominoGenerator {
    var next_wasCalled = false
    var next_return:Tetromino = STetromino(position: (0, 0))
    func next() -> Tetromino {
        next_wasCalled = true
        return next_return
    }
}
