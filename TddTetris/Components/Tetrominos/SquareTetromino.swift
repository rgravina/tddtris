struct SquareTetromino: Tetromino {
    var position: (column: Int, row: Int)
    var blocks: Array<(column: Int, row: Int)>
    var height = 2
}