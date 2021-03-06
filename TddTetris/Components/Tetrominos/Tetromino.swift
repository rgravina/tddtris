protocol Tetromino {
    var position: (column: Int, row: Int) { get set }
    var blocks: Array<(column: Int, row: Int)> { get }
    var lowerFacingBlocks: Array<(column: Int, row: Int)> { get }
    var leftFacingBlocks: Array<(column: Int, row: Int)> { get }
    var rightFacingBlocks: Array<(column: Int, row: Int)> { get }
    func move(_ direction: Direction) -> Tetromino
    func rotate() -> Tetromino
}
