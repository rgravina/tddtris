struct STetromino: Tetromino {
    var position = (column: 0, row: 0)
    var blocks = Array<(row: Int, column: Int)>()
}