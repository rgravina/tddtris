struct SquareTetromino: Tetromino {
    var position: (column: Int, row: Int)
    var blocks: Array<(row: Int, column: Int)>
}