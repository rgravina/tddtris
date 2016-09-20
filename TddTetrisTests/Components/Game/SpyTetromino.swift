import Foundation
@testable import TddTetris

class SpyTetromino: Tetromino {
    var position = (column: 0, row: 0)
    var blocks = Array<(column: Int, row: Int)>()
    var lowerFacingBlocks = Array<(column: Int, row: Int)>()
    var leftFacingBlocks = Array<(column: Int, row: Int)>()
    var rightFacingBlocks = Array<(column: Int, row: Int)>()

    var move_arguments: Direction!
    var move_returnValue: Tetromino!
    func move(_ direction: Direction) -> Tetromino {
        move_arguments = direction
        return move_returnValue
    }

    var rotate_wasCalled = false
    var rotate_returnValue: Tetromino!
    func rotate() -> Tetromino {
        rotate_wasCalled = true
        return rotate_returnValue
    }
}
