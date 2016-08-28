protocol Tetromino {
    var position: (column: Int, row: Int) { get set }
    var blocks: Array<(row: Int, column: Int)> { get set }
}