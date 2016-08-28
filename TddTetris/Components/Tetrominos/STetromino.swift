struct STetromino: Tetromino {
    var position = (column: 0, row: 0)
    var height = 2
    var blocks = Array<(column: Int, row: Int)>()
}