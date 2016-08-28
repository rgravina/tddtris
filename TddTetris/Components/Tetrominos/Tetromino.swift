protocol Tetromino {
    var position: (column: Int, row: Int) { get set }
    var blocks: Array<(column: Int, row: Int)> { get set }
    var lowerBlocks: Array<(column: Int, row: Int)> { get }
}